class User < ActiveRecord::Base

	acts_as_messageable
	acts_as_avatarable :default_url => "missing.png"



  has_many :offers
	has_many :requests
	has_one :profile
	has_one :gallery
	has_many :pictures, through: :gallery

	accepts_nested_attributes_for :profile



	has_attached_file :avatar,
			              :default_url => ":rails_root/public/images/missing.png",
	                  :path => ":rails_root/public/images/:id/:filename",
	                  :url  => "/images/:id/:filename",
	                  :styles => { :large => "2000x2000>" }


	do_not_validate_attachment_file_type :avatar





=begin

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	do_not_validate_attachment_file_type :avatar
=end

	enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :admin
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
	:skip_confirmation!



	def mailboxer_email(option)
		email
	end

end
