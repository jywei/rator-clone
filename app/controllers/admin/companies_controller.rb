class Admin::CompaniesController < ApplicationController

  before_action :authenticate_user!
  before_action :check_admin
  before_action :find_company, only: [:show, :edit, :update, :destroy]

  def index
    @tags = CompanyTag.all
    @categories = CompanyCategory.all
    @companies = Company.all
    @areas = Area.all

    if params[:published]
      @companies = @companies.order("published_on DESC")
    end

    if params[:area]
      @area = Area.find(params[:area])
      @companies = @area.companies
    end

    if params[:tag]
      @tag = Tag.find(params[:tag])
      @companies = @tag.companies
    end

    if params[:category]
      @category = Category.find(params[:category])
      @companies = @category.companies
    end

    if params[:keyword]
      @companies = @companies.where( [ "name like ?", "%#{params[:keyword]}%" ] )
    end

    @companies = @companies.order("id DESC").page(params[:page]).per(30).includes(:company_category, :members, :jobs)

  end

  def show
  end

  def edit
  end

  def update
    if @company.update(company_params)
      flash[:notice] = "Update Success"
      redirect_to admin_company_path(@company)
    else
      flash.now[:alert] = "Update Failure"
      render "edit"
    end
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if  @company.save
      flash[:notice] = "Create Success"
      redirect_to admin_company_path(@company)
    else
      flash.now[:alert] = "Create Failure"
      render "new"
    end
  end

  def destroy
    @company.destroy
    redirect_to :back
  end

  def company_form
    @company_forms = CompanyForm.order("id DESC").all
  end

  protected

  def find_company
    @company = Company.find_by_en_name(params[:id])
  end

  def company_params
    params.require(:company).permit(:interview, :published_on, :sequence, :name, :en_name, :about, :brand, :phone, :email, :address, :scale ,:introduction, :idea, :story, :welfare, :video, :web, :number, :capital, :company_tag_list, :logo, :logo_alt, :fb, :ios, :android, :company_category_id, :area_id,
                                    :banners_attributes => [:id, :banner, :banner_alt, :_destroy],
                                    :galleries_attributes => [:id, :gallery, :gallery_alt, :_destroy],
                                    :socials_attributes => [:id, :title, :url, :_destroy])
  end

end
