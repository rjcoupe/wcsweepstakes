class Team < ActiveRecord::Base
	belongs_to :person
	belongs_to :group

	def list_matches(played = false)
		if played == true then
			Match.where('(team1 = ? OR team2 = ?) AND (team1_goals is not null AND team2_goals is not null)', self.id, self.id)
		else
			Match.where('team1 = ? OR team2 = ?', self.id, self.id)
		end
	end

	def list_results(type)
		case type
		when 'w'
			Match.where('(team1 = ? AND team1_goals > team2_goals) OR (team2 = ? AND team2_goals > team1_goals)')
		when 'd'
			Match.where('(team1 = ? OR team2 = ?) AND team1_goals = team2_goals')
		when 'l'
			Match.where('(team1 = ? AND team1_goals < team2_goals) OR (team2 = ? AND team2_goals < team1_goals)')
		end
	end

	
end
