class UsersController < ApplicationController
    before_action :authenticate_user!
    after_action :verify_authorized
    layout "application_admin"
    def index
      @users = User.all
      authorize User
      render layout: "application_admin" 
    end
  
    def show
      @user = User.find(params[:id])
      authorize @user
    end
  
    def update
      @user = User.find(params[:id])
      authorize @user
      if @user.update_attributes(secure_params)
        redirect_to users_path, :notice => "User updated."
      else
        redirect_to users_path, :alert => "Unable to update user."
      end
    end
  
    def destroy
      user = User.find(params[:id])
      authorize user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    end

    def new
        redirect_to "home/index"
    end
  
    private
  
    def secure_params
      params.require(:user).permit(:role)
    end
  
  end