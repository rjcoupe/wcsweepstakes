class Person < ActiveRecord::Base
	has_many :teams

	def assign_team(num = 1)
		available_teams = Team.where(person_id: nil)
		return false if available_teams.nil?
		num.times do
			t = available_teams.shuffle.first
			t.update_attribute(:person, self)
		end
	end
end
