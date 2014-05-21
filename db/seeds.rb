# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Person.create(
	[
		{name: 'Richard'},
		{name: 'Dafydd'},
		{name: 'Gareth'},
		{name: 'Indira'},
		{name: 'Greg'},
		{name: 'Adam'},
		{name: 'Rachel'},
		{name: 'Barbara'},
		{name: 'Nigel'}
	]
)

Group.create( [
		{letter: 'A'},
		{letter: 'B'},
		{letter: 'C'},
		{letter: 'D'},
		{letter: 'E'},
		{letter: 'F'},
		{letter: 'G'},
		{letter: 'H'},
	])

Team.create(
	[
		{name: 'Brazil', group_id: Group.find_by(letter: 'A').id}, {name: 'Greece', group_id: Group.find_by(letter: 'C').id}, {name: 'France', group_id: Group.find_by(letter: 'E').id},
		{name: 'Croatia', group_id: Group.find_by(letter: 'A').id}, {name: 'Ivory Coast', group_id: Group.find_by(letter: 'C').id}, {name: 'Honduras', group_id: Group.find_by(letter: 'E').id},
		{name: 'Mexico', group_id: Group.find_by(letter: 'A').id}, {name: 'Japan', group_id: Group.find_by(letter: 'C').id}, 
		{name: 'Cameroon', group_id: Group.find_by(letter: 'A').id}, {name: 'Uruguay', group_id: Group.find_by(letter: 'D').id}, {name: 'Argentina', group_id: Group.find_by(letter: 'F').id},
		{name: 'Spain', group_id: Group.find_by(letter: 'B').id}, {name: 'Costa Rica', group_id: Group.find_by(letter: 'D').id}, {name: 'Bosnia & Herzegovina', group_id: Group.find_by(letter: 'F').id},
		{name: 'Netherlands', group_id: Group.find_by(letter: 'B').id}, {name: 'England', group_id: Group.find_by(letter: 'D').id}, {name: 'Iran', group_id: Group.find_by(letter: 'F').id},
		{name: 'Chile', group_id: Group.find_by(letter: 'B').id}, {name: 'Italy', group_id: Group.find_by(letter: 'D').id}, {name: 'Nigeria', group_id: Group.find_by(letter: 'F').id},
		{name: 'Australia', group_id: Group.find_by(letter: 'B').id}, {name: 'Switzerland', group_id: Group.find_by(letter: 'E').id}, {name: 'Germany', group_id: Group.find_by(letter: 'G').id},
		{name: 'Colombia', group_id: Group.find_by(letter: 'C').id}, {name: 'Ecuador', group_id: Group.find_by(letter: 'E').id}, {name: 'Portugal', group_id: Group.find_by(letter: 'G').id},
		{name: 'Ghana', group_id: Group.find_by(letter: 'G').id}, {name: 'USA', group_id: Group.find_by(letter: 'G').id}, {name: 'Belgium', group_id: Group.find_by(letter: 'H').id},
		{name: 'Algeria', group_id: Group.find_by(letter: 'H').id}, {name: 'Russia', group_id: Group.find_by(letter: 'H').id}, {name: 'South Korea', group_id: Group.find_by(letter: 'H').id},

	]
)

Match.create([
	{group: Group.find_by(letter: 'A'), team1: Team.find_by(name: 'Brazil').id, team2: Team.find_by(name: 'Croatia').id, date: '12 June 2014 21:00', stage: 'G'},
	{group: Group.find_by(letter: 'A'), team1: Team.find_by(name: 'Mexico').id, team2: Team.find_by(name: 'Cameroon').id, date: '13 June 2014 17:00', stage: 'G'},
	{group: Group.find_by(letter: 'A'), team1: Team.find_by(name: 'Brazil').id, team2: Team.find_by(name: 'Mexico').id, date: '17 June 2014 20:00', stage: 'G'},
	{group: Group.find_by(letter: 'A'), team1: Team.find_by(name: 'Cameroon').id, team2: Team.find_by(name: 'Croatia').id, date: '18 June 2014 23:00', stage: 'G'},
	{group: Group.find_by(letter: 'A'), team1: Team.find_by(name: 'Cameroon').id, team2: Team.find_by(name: 'Brazil').id, date: '23 June 2014 21:00', stage: 'G'},
	{group: Group.find_by(letter: 'A'), team1: Team.find_by(name: 'Croatia').id, team2: Team.find_by(name: 'Mexico').id, date: '23 June 2014 21:00', stage: 'G'}
])