class Location < ActiveRecord::Base




	has_one :profile
	has_one :location

	has_many :offers
	has_many :requests


end