class AddGiveToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :give, :text
    add_column :offers, :city, :string
    add_column :offers, :address, :string
    add_column :offers, :state, :string
  end
end
