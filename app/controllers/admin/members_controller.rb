class Admin::MembersController < ApplicationController

  before_action :authenticate_user!
  before_action :check_admin

  before_action :find_company
  before_action :find_members, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @member = @company.members.new
  end

  def create
    @member = @company.members.new(member_params)
    if @member.save
      flash[:notice] = "Create Success"
     redirect_to admin_company_member_path(@company,@member)
    else
      flash.now[:alert] = "Create Failure"
      render "new"
    end
  end

  def edit
  end

  def update
    if @member.update(member_params)
      flash[:notice] = "Update Success"
      redirect_to admin_company_member_path(@company,@member)
    else
      flash.now[:alert] = "Update Failure"
      render "edit"
    end
  end

  def destroy
    @member.destroy
    redirect_to admin_company_members_path(@company)
  end

  protected

  def find_company
    @company = Company.find_by_en_name(params[:company_id])
    @members = @company.members
  end

  def find_members
    @member = @company.members.find(params[:id])
  end

  def member_params
   params.require(:member).permit(:name, :office, :about, :photo, :photo_alt)
  end

end
