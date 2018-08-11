class Topic < ApplicationRecord
  include UsesDefaultAssets

  validates_presence_of :title, :description, :max_units
  validates :max_units, :numericality => { :greater_than => 0}, :on => :save

  has_many :unit_of_educations

  belongs_to :user
  has_one_attached :image

  before_save :check_completion

  before_create :set_default_image

  def total_points_value
    sum_points unit_of_educations
  end

  def completed_points_value
    sum_points completed_units
  end

  def units_remaining
    max_units - completed_units.size
  end

  def completed_units
    unit_of_educations.select{|unit| unit.completed?}
  end

  def completed?
    #  cannot be zero
    unit_of_educations.size>0 &&  units_remaining.equal?(0)
  end

  private

  def sum_points units_to_sum
    units_to_sum.map(&:points).inject(0, &:+)
  end

  def check_completion
      if completed? && complete_date.nil?
        update_attribute(:complete_date, Time.now)
      end
  end

  def set_default_image
    image_path = random_topic_image_path
    self.image.attach(io: File.open(image_path), filename: File.basename(image_path))
  end

end
