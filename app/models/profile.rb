class Profile < ActiveRecord::Base


	acts_as_avatarable

	belongs_to :user
	has_one :location
	has_one :gallery
	validates_presence_of :gallery
	has_many :pictures, through: :gallery

	has_attached_file :avatar,
	                  :path => ":rails_root/public/images/:id/:filename",
	                  :url  => "/images/:id/:filename",
	                  :styles => { :large => "1000x1000>" }


	do_not_validate_attachment_file_type :avatar
end
