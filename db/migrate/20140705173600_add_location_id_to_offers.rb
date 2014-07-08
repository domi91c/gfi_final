class AddLocationIdToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :location_id, :integer
  end
end
