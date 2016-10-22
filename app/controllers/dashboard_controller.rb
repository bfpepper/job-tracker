class DashboardController < ApplicationController

  def show
    @jobs = Job.all.group_by(&:level_of_interest)
  end

end
