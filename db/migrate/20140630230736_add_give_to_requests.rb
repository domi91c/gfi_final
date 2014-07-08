class AddGiveToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :give, :text
  end
end
