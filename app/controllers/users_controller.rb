class UsersController < ApplicationController
  before_action :authenticate_user!, except: :view_resume
  before_action :set_user

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "更新成功"
      redirect_to :back
    else
      flash.now[:alert] = "更新失敗"
      render "resume"
    end
  end

  def resume
  end

  def follows
  end

  def preview
    @user = current_user
  end

  def view_resume
     apply = UserJobApply.find_by_token!( params[:token] )
     @user = apply.user
  end

  private

  def user_params
   params.require(:user).permit(:name, :email, :phone, :sex, :address, :birthday, :summary, :resume, :photo,
                                :collections_attributes => [:id, :content, :url, :_destroy],
                                :educations_attributes => [:id, :content, :department, :school, :date_begin, :date_end, :_destroy],
                                :experiences_attributes => [:id, :content, :office, :company, :date_begin, :date_end, :_destroy],
                                :skills_attributes => [:id, :name, :content, :degree, :date_begin, :date_end, :_destroy],
                                :languages_attributes => [:id, :name, :content, :degree, :_destroy])
  end

  def set_user
    @user = current_user
  end

end
