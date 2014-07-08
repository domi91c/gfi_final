class Offer < ActiveRecord::Base

	# validates :age, numericality: true
	# validates :username, presence: true
	# validates :username, uniqueness: true
	# validates :terms, acceptance: true
	# validates :password, confirmation: true
	# validates :username, exclusion: { in: %w(admin superuser) }
	# validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	# validates :age, inclusion: { in: 0..9 }
	validates :title, length: { maximum: 100 }
	validates :description, length: { minimum: 200 }


	acts_as_gmappable :process_geocoding => false

	belongs_to :user
	belongs_to :location




	def self.search(query, query2, query3)
		where("title like ?", "%#{query}%").where("category like ?", "%#{query2}%").where("city like ?", "%#{query3}%")
	end

	def gmaps4rails_address
		def gmaps4rails_address
			"#{address}"
		end
	end


end
