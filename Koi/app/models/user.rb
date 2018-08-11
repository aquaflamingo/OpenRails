class User < ApplicationRecord
  include UsesDefaultAssets
  has_many :topics
  validates_presence_of :name

  has_one_attached :avatar

  before_create :set_default_avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private

  def set_default_avatar
    image_path = random_avatar_image_path
    self.avatar.attach(io: File.open(image_path), filename: File.basename(image_path))
  end
end
