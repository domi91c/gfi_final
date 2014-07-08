class AddSelectedToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :selected_category, :string
    add_column :requests, :selected_location, :string
  end
end
