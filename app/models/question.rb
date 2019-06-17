class Question < ApplicationRecord
  belongs_to :location

  validates :text, presence: true, length: { maximum: 255 }
  validates :image, presence: true
  validates :answer, presence: true, length: { maximum: 255 }

  mount_uploader :image, ImageUploader
end
