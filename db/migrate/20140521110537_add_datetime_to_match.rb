class AddDatetimeToMatch < ActiveRecord::Migration
  def change
  		add_column :matches, :date, :datetime
  end
end
