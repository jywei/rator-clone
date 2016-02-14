class Admin::AdvertsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @adverts = Advert.all
  end

  def show
    @advert = Advert.find(params[:id])
  end

  def new
     @advert = Advert.new
  end

  def create
    @advert = Advert.new(advert_params)
    @advert.save
    redirect_to admin_adverts_path
  end

  def edit
    @advert = Advert.find(params[:id])
  end

  def update
    @advert = Advert.find(params[:id])
    @advert.update(advert_params)
    redirect_to admin_adverts_path
  end

  def destroy
    @advert = Advert.find(params[:id])
    @advert.destroy

    redirect_to admin_adverts_path
  end

  private

  def advert_params
    params.require(:advert).permit(:name, :content, :date, :advert_banners_attributes => [:id, :banner, :banner_url, :banner_alt, :target, :_destroy])
  end
end
