# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

user1 = CreateUserService.new.call("user1@example.com", 'John Smith')
puts 'CREATED USER USER: ' << user1.email

user2 = CreateUserService.new.call("user2@example.com", 'Dave Bails')
puts 'CREATED USER USER: ' << user2.email

user3 = CreateUserService.new.call("user3@example.com", 'Marshall Matthers')
puts 'CREATED USER USER: ' << user3.email

user4 = CreateUserService.new.call("user4@example.com", 'Craig Charles')
puts 'CREATED USER USER: ' << user4.email

user5 = CreateUserService.new.call("user5@example.com", 'Lucinda Day')
puts 'CREATED USER USER: ' << user5.email

user6 = CreateUserService.new.call("user6@example.com", 'Michael Jackson')
puts 'CREATED USER USER: ' << user6.email

user7 = CreateUserService.new.call("user7@example.com", 'Sinead Doors')
puts 'CREATED USER USER: ' << user7.email

user8 = CreateUserService.new.call("user8@example.com", 'Steph Yale')
puts 'CREATED USER USER: ' << user8.email

user9 = CreateUserService.new.call("user9@example.com", 'Yolanda Yttrium')
puts 'CREATED USER USER: ' << user9.email

user10 = CreateUserService.new.call("user10@example.com", 'Peter Parker')
puts 'CREATED USER USER: ' << user10.email

sport1 = Sport.create(name: 'Football')
puts 'CREATED SPORT: ' << sport1.name

sport2 = Sport.create(name: 'Rugby')
puts 'CREATED SPORT: ' << sport2.name

sport3 = Sport.create(name: 'Pool')
puts 'CREATED SPORT: ' << sport3.name

team = Team.create(name: 'Manchester United', sport: sport1)
puts 'CREATED TEAM: ' << team.name
user1.owned_teams << team

team = Team.create(name: 'Liverpool', sport: sport1)
puts 'CREATED TEAM: ' << team.name
user2.owned_teams << team

team = Team.create(name: 'Arsenal', sport: sport1)
puts 'CREATED TEAM: ' << team.name
user3.owned_teams << team

team = Team.create(name: 'Leicester City', sport: sport1)
puts 'CREATED TEAM: ' << team.name
user4.owned_teams << team

team = Team.create(name: 'Chelsea', sport: sport1)
puts 'CREATED TEAM: ' << team.name
user5.owned_teams << team

team = Team.create(name: 'Manchester City', sport: sport1)
puts 'CREATED TEAM: ' << team.name
user6.owned_teams << team

team = Team.create(name: 'Tottenham Hotspur', sport: sport1)
puts 'CREATED TEAM: ' << team.name
user7.owned_teams << team

team = Team.create(name: 'West Ham', sport: sport1)
puts 'CREATED TEAM: ' << team.name
user8.owned_teams << team

team = Team.create(name: 'Newcastle United', sport: sport1)
puts 'CREATED TEAM: ' << team.name
user9.owned_teams << team

team = Team.create(name: 'Aston Villa', sport: sport1)
puts 'CREATED TEAM: ' << team.name
user10.owned_teams << team

team = Team.create(name: 'Sale', sport: sport2)
puts 'CREATED TEAM: ' << team.name
user1.owned_teams << team

team = Team.create(name: 'Bath', sport: sport2)
puts 'CREATED TEAM: ' << team.name
user2.owned_teams << team

team = Team.create(name: 'Wasps', sport: sport2)
puts 'CREATED TEAM: ' << team.name
user3.owned_teams << team

team = Team.create(name: 'Gloucester', sport: sport2)
puts 'CREATED TEAM: ' << team.name
user4.owned_teams << team

team = Team.create(name: 'Leicester', sport: sport2)
puts 'CREATED TEAM: ' << team.name
user5.owned_teams << team

team = Team.create(name: 'Toulouse', sport: sport2)
puts 'CREATED TEAM: ' << team.name
user6.owned_teams << team

team = Team.create(name: 'Exeter', sport: sport2)
puts 'CREATED TEAM: ' << team.name
user7.owned_teams << team

team = Team.create(name: 'Bristol', sport: sport2)
puts 'CREATED TEAM: ' << team.name
user8.owned_teams << team



