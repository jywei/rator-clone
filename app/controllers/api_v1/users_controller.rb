class ApiV1::UsersController < ApiController

  def show
    if authenticate_user_from_token!
       @user = User.find_by_fb_uid(params[:id])

    else
       render :json => { :message => "auth_token fail"}
    end

  end

  def create
    if authenticate_user_from_token!
       @user = User.find_by_fb_uid(params[:user_fb_uid])
       @user = @user.update(user_params)
       render :json => { :message => "ok!!!"}
    else
       render :json => { :message => "auth_token fail"}
    end
  end

  private

  def user_params
    params.permit(:name, :email, :phone, :sex, :address, :birthday, :summary, :resume, :photo,
                  :collections_attributes => [:id, :content, :_destroy],
                  :educations_attributes => [:id, :content, :department, :school, :date_begin, :date_end, :_destroy],
                  :experiences_attributes => [:id, :content, :office, :company, :date_begin, :date_end, :_destroy],
                  :skills_attributes => [:id, :name, :content, :degree, :date_begin, :date_end, :_destroy],
                  :languages_attributes => [:id, :name, :content, :degree, :_destroy])
  end
end
