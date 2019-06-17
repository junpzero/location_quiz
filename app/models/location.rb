class Location < ApplicationRecord
  has_one :question, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }
  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :description, length: { maximum: 255 }
  validates :hint, length: { maximum: 255 }

  mount_uploader :image, ImageUploader
end
