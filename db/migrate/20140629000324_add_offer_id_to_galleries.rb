class AddOfferIdToGalleries < ActiveRecord::Migration
	def change
		add_column :galleries, :offer_id, :integer
	end
end
