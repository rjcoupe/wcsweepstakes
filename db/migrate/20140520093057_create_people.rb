class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
    	t.string		:name, :null => false
    	t.boolean		:eliminated, :default => false
		t.timestamps
    end
  end
end
