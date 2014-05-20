class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
    	t.string		:letter
      	t.timestamps
    end
  end
end
