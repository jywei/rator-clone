class ApiV1::JobsController < ApiController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

end
