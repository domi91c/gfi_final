class AddCategoryToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :category, :string
  end
end
