class Match < ActiveRecord::Base
	after_save	:sync_group_points

	belongs_to :group

	def sync_group_points
		[self.team1, self.team2].each do |id|
			t = Team.find(id)
			t.update_attribute(:qpoints, (t.list_results('w', 'G').count * 3) + t.list_results('d', 'G').count)
		end
	end
end
