class AddGmapsToOffers < ActiveRecord::Migration
  def change
	  add_column :offers, :gmap, :boolean
	  add_column :offers, :latitude, :float
	  add_column :offers, :longitude, :float

  end
end
