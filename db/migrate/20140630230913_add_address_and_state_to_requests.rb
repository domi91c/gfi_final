class AddAddressAndStateToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :address, :string
    add_column :requests, :state, :string
  end
end
