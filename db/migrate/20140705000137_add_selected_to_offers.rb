class AddSelectedToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :selected_category, :string
    add_column :offers, :selected_location, :string
  end
end
