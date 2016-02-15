class League < ActiveRecord::Base
  has_one :competition, as: :competition_format
  accepts_nested_attributes_for :competition

  def calculate_league_table
    out = []
    competition.teams.each do |t|
      played = 0
      won = 0
      lost = 0
      draw = 0
      gplus = 0
      gminus = 0
      points = 0
      competition.fixtures.each do |f|
        score_1 = f.scores.first
        score_2 = f.scores.second
        team_1 = score_1.team
        team_2 = score_2.team
        t1_score = score_1.points
        t2_score = score_2.points
        if((t == team_1 || t == team_2) && !t1_score.nil?)
          played += 1
          if(team_1 == t)
            gplus += t1_score
            gminus += t2_score

            if(t1_score == t2_score)
              draw += 1
              points += 1
            else
              if(t1_score >= t2_score)
                won += 1
                points += 3
              else
                if(t1_score <= t2_score)
                  lost += 1
                end
              end
            end

          else
            gplus += t2_score
            gminus += t1_score

            if(t1_score == t2_score)
              draw += 1
              points += 1
            else
              if(t1_score >= t2_score)
                lost += 1
              else
                if(t1_score <= t2_score)
                  won += 1
                  points += 3
                end
              end
            end

          end
        end
      end

      out.push([t.id, played, won, draw, lost, gplus, gminus, points])
    end
    out.sort_by! {|e| [-e[7], (e[5]-e[6])]}
    return out
  end

  def generate_fixtures
    team_count = competition.teams.count
    team_array = competition.teams
    even = false

    if team_count.even?
      rounds = team_count - 1
      even = true
    else
      team_count += 1
      rounds = team_count - 1
      team_array.push(bye = Team.new(name: 'bye12'))
    end

    round = 1

    while round <= rounds
      cur_team = 0
      team_array.each do |t|
        if cur_team <= ((team_count / 2) - 1)
          opponent = team_array[team_count - 1 - cur_team]
          if opponent.name != 'bye12' && t.name != 'bye12'
            fixture = Fixture.create(competition: competition, round: round)
            fixture.scores.create(team: t, is_home: true)
            fixture.scores.create(team: opponent, is_home: false)

            fixture2 = Fixture.create(competition: competition, round: rounds + round)
            fixture2.scores.create(team: t, is_home: false)
            fixture2.scores.create(team: opponent, is_home: true)
          end
        end

        cur_team += 1
      end
      team_array = perm_array(team_array)
      round += 1
    end
    if !even
      bye.destroy
    end
  end

  def perm_array(ar)
    newar = []
    currentin = 0
    ar.each do |e|
      if currentin != ar.length - 1
        newar.push(e)
      else
        newar.insert(1, e)
      end
      currentin += 1
    end
    return newar
  end
end
