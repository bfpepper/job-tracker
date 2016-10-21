class CommentsController < ApplicationController

  def create
    job = Job.find(params[:job][:id])
    company = job.company
    @comment = Comment.new(comment_params)
    @comment.job_id = job.id
    if @comment.save
      redirect_to company_job_path(company, job)
    else
      flash[:notice] = "You must add a comment to submit a comment"
      redirect_to company_job_path(company, job)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
