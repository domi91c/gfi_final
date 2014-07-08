class RegistrationsController < Devise::RegistrationsController
	before_filter :configure_permitted_parameters, if: :devise_controller?

	def create
		super
		@profile = Profile.new
		@profile.save
		resource.profile = @profile
	end


	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:users) do |u|
			u.permit(:avatar, :email, :password, :password_confirmation, :name)
		end
	end

end