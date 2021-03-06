class CompaniesController < ApplicationController
  before_action :find_company, only: [:show, :edit, :update, :destroy]

  def index
    if params.include?("sort")
      @companies = Company.all.ordered_list
      render :sorted_index
    elsif params.include?("location")
      @companies = Company.where(city: params[:location])
      @city = "#{params[:location]}"
      render :location_index
    else
      @companies = Company.all
      render :index
    end
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = "#{@company.name} added!"
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def show
    redirect_to company_jobs_path(@company)
  end

  def edit
  end

  def update
    @company.update(company_params)
    if @company.save
      flash[:success] = "#{@company.name} updated!"
      redirect_to company_path(@company)
    else
      render :edit
    end
  end

  def destroy
    @company.delete
    flash[:success] = "#{@company.name} was successfully deleted!"
    redirect_to companies_path
  end


  private

  def find_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :city)
  end
end
