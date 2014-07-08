class Request < ActiveRecord::Base

	belongs_to :user
	has_one :gallery
	validates_presence_of :gallery
	has_many :pictures, through: :gallery

	validates :title, length: { maximum: 150 }

	# validates_attachment_presence :photo
	# validates_attachment_size :photo, :less_than => 5.megabytes
	# validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']



	def self.search(query, query2, query3)
		where("title like ?", "%#{query}%").where("category like ?", "%#{query2}%").where("city like ?", "%#{query3}%")
	end

end
