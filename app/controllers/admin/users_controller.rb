class Admin::UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :check_admin

  def index
    @users = User.all

    if params[:order]
      @users = @users.order("birthday ASC")
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Update Success"
      redirect_to admin_users_path
    else
      flash.now[:alert] = "Update Failure"
      render "edit"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :back
  end

  protected

  def user_params
   params.require(:user).permit(:name, :nickname, :phone, :address, :sex, :birthday, :summary, :skill, :language, :email)
  end
end
