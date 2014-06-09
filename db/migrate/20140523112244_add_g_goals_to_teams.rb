class AddGGoalsToTeams < ActiveRecord::Migration
  def change
  	add_column 	:teams, :ggoals_for, :integer, :default => 0
  	add_column	:teams, :ggoals_against, :integer, :default => 0
  end
end
