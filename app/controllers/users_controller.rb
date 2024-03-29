class UsersController < ApplicationController
 # before_filter :authenticate_user!
  #after_action :verify_authorized

  def index
    @users = User.all
    # authorize User
  end

  def show
    @user = User.find(params[:id])
    @user.build_profile
	  @requests = @user.requests#.paginate(:page => params[:page], :per_page => 5)
    @offers = @user.offers#.paginate(:page => params[:page], :per_page => 5)

	  #authorize @user
  end

  def update
    @user = User.find(params[:id])
   # authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
   # authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def secure_params
    params.require(:user).permit(:role, :avatar)
  end

end
