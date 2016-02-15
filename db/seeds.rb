# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

user = CreateOrganiserService.new.call("organiser@example.com")
puts 'CREATED ORGANISER USER: ' << user.email

org = CreateOrganisationService.new.call(user, "Bath")
puts 'CREATED ORGANISATION: ' << org.name << " ORGANISER: " << user.email

user1 = CreateUserService.new.call("user1@example.com", org, 'User1 John')
puts 'CREATED USER USER: ' << user1.email

user2 = CreateUserService.new.call("user2@example.com", org, 'User2 Steve')
puts 'CREATED USER USER: ' << user2.email

user3 = CreateUserService.new.call("user3@example.com", org, 'User3 Kyle')
puts 'CREATED USER USER: ' << user3.email

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
user1.owned_teams << team

team = Team.create(name: 'Arsenal', sport: sport1)
puts 'CREATED TEAM: ' << team.name
user1.owned_teams << team

