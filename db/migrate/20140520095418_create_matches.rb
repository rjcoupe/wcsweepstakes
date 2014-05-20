class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
    	t.string		:stage
    	t.integer		:team1, :null => false
    	t.integer		:team2, :null => false
    	t.integer		:team1_goals
    	t.integer		:team2_goals
      	t.timestamps
    end
  end
end
