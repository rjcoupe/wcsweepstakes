class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
    	t.string		:name, :null => false, :unique => true
    	t.references	:person
    	t.references	:group
      	t.timestamps
    end
  end
end
