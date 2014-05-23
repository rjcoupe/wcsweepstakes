class Match < ActiveRecord::Base
	after_save	:sync_group_stats

	belongs_to :group

	def sync_group_stats
		[self.team1, self.team2].each do |id|
			t = Team.find(id)
			t.update_attribute(:qpoints, (t.list_results('w', 'G').count * 3) + t.list_results('d', 'G').count)
			t.update_attribute(:ggoals_for, t.ggoals('f'))
			t.update_attribute(:ggoals_against, t.ggoals('a'))
		end
	end

	def self.import_from_csv(path)
		require 'csv'
		raw = File.read(path)
		csv = CSV.parse(raw, :headers => false)
		csv.each do |f|
			f_date = f[0]
			f_time = f[1]
			f_team1 = f[2]
			f_team2 = f[3]
			Match.create({
				stage: 'G',
				team1: Team.find_by(name: f_team1).id,
				team2: Team.find_by(name: f_team2).id,
				date: "#{f_date} #{f_time}",
				group_id: Team.find_by(name: f_team1).group_id
				})
		end
	end
 
end
