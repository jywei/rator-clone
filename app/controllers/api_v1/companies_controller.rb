class ApiV1::CompaniesController < ApiController

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

end