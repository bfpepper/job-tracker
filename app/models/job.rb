class Job < ActiveRecord::Base
  validates :title, :level_of_interest, presence: true
  has_many :comments
  belongs_to :company
  belongs_to :category

  def ordered_comments
    comments.order(created_at: :desc)
  end

  def self.sorted_jobs
    order(level_of_interest: :desc)
  end
end
