class AddQPointsToTeams < ActiveRecord::Migration
  def change
  	add_column :teams, :qpoints, :integer, :default => 0
  end
end
