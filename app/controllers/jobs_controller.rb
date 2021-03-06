class JobsController < ApplicationController
  before_action :find_company, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :find_job, only: [:show, :edit, :update, :destroy]

  def index
    @jobs = @company.jobs
    @contact = Contact.new
  end

  def sorted
    @jobs = Job.all.sorted_jobs
    render :sorted_index
  end

  def new
    @job = Job.new()
    @categories = Category.all
  end

  def create
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
  end

  def edit
    @categories = Category.all
  end

  def update
    if @job.update(job_params)
      redirect_to company_jobs_path(@company)
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to company_jobs_path(@company)
  end

  private

  def find_company
    @company = Company.find(params[:company_id])
  end

  def find_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :category_id)
  end
end
