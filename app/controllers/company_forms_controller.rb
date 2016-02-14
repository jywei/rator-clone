class CompanyFormsController < ApplicationController
  def new
    @company_form = CompanyForm.new
  end

  def create
    @company_form = CompanyForm.new(params.require(:company_form).permit(:name, :phone, :email, :content, :category))
    if @company_form.save
      flash[:notice]= "寄送成功"
      redirect_to :back
    else
      flash.now[:alert]= "寄送失敗"
      render "new"
    end
  end

  def show
    @company_form = CompanyForm.find(params[:id])
  end
end
