class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.string :selected
      t.integer :offer_id
      t.string :request_id

      t.timestamps
    end
  end
end
