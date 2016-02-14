class Admin::AreasController < ApplicationController

  before_action :authenticate_user!
  before_action :check_admin

  def create
    @area = Area.new(area_params)
    @area.save
    redirect_to admin_company_categories_path
  end

  def destroy
    @area = Area.find(params[:id])
    unless  @area.destroy
      flash.now[:alert] = "有資料不能刪"
    end
    redirect_to admin_company_categories_path
  end

  def update
    @area = Area.find(params[:id])
    @area.update(area_params)
    redirect_to admin_company_categories_path
  end

  private

  def area_params
    params.require(:area).permit(:name, :position)
  end
end
