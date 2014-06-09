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
		matches = self.list_matches(true, 'G')
		goals = 0
		case type
		when 'f'
			matches.each do |m|
				if m.team1 == self.id then
					goals += m.team1_goals
				elsif m.team2 == self.id then
					goals += m.team2_goals
				end
			end
		when 'a'
			matches.each do |m|
				if m.team1 == self.id then
					goals += m.team2_goals
				elsif m.team2 == self.id then
					goals += m.team1_goals
				end
			end
		end
		goals
	end

	def max_gpoints
		3 * (3 - self.list_matches(true, 'G').count) + self.qpoints
	end

	def group_position
		k = 0
		Team.where('group_id = ?', self.group_id).order('qpoints DESC, (ggoals_for - ggoals_against) DESC, ggoals_for DESC, ggoals_against ASC').each do |t|
			k += 1
			puts "Team: #{t}"
			puts "Key: #{k}"
			if t == self then
				return k
			end
		end
	end

	def has_qualified?
		can_get_more_points = 0
		self.group.teams.where('id != ?', self.id).each do |t|
			can_get_more_points += 1 if t.max_gpoints >= self.qpoints
			puts "#{t.name} can get #{t.max_gpoints}"
		end
		puts "I can get #{self.max_gpoints}"
		can_get_more_points >= 2 ? false : true
	end

	def can_qualify?
		return true if self.group_position <= 2
		needed = Team.where('group_id = ?', self.group_id).order('qpoints DESC, (ggoals_for - ggoals_against) DESC, ggoals_for DESC, ggoals_against ASC')[1].qpoints
		if needed > self.max_gpoints then
			return false
		else
			return true
		end
	end

	def flag(size)
		case self.name
			when 'Greece'
				name = 'greece'
			when 'Costa Rica'
				name = 'Costa-rica'
			when 'Ivory Coast'
				name = 'Cote_d\'Ivoire'
			when 'Bosnia & Herzegovina'
				name = 'Bosnia-and-Herzegovina'
			when 'South Korea'
				name = 'South-Korea'
			else
				name = self.name
		end
		"/assets/flags/#{size}/#{name}.png"
	end


	
end
