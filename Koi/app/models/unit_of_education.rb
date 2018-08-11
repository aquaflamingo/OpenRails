class UnitOfEducation < ApplicationRecord
  validates_presence_of :title, :points
  belongs_to :topic

  def completed?
    !completed_at.blank?
  end
end
