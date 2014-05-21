class Team < ActiveRecord::Base
	belongs_to :person
	belongs_to :group

	def list_matches(played = false, stage)
		if played == true then
			Match.where('stage = ? AND (team1 = ? OR team2 = ?) AND (team1_goals is not null AND team2_goals is not null)', stage, self.id, self.id)
		else
			Match.where('stage = ? AND team1 = ? OR team2 = ?', stage, self.id, self.id)
		end
	end

	def list_results(type, stage)
		case type
		when 'w'
			Match.where('stage = ? AND (team1 = ? AND team1_goals > team2_goals) OR (team2 = ? AND team2_goals > team1_goals)', stage, self.id, self.id)
		when 'd'
			Match.where('stage = ? AND (team1 = ? OR team2 = ?) AND team1_goals = team2_goals', stage, self.id, self.id)
		when 'l'
			Match.where('stage = ? AND (team1 = ? AND team1_goals < team2_goals) OR (team2 = ? AND team2_goals < team1_goals)', stage, self.id, self.id)
		end
	end

	def gpoints
		self.qpoints
	end

	def ggoals(type)
		case type
		when 'f'
		when 'a'
		end
	end

	def max_gpoints
		3 * (3 - self.list_matches(true, 'G').count)
	end

	
end
