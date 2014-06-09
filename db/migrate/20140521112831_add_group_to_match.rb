class AddGroupToMatch < ActiveRecord::Migration
  def change
  	add_column :matches, :group_id, :integer, :null => false, :default => 0
  end
end
