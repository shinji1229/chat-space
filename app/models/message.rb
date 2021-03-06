class Message < ApplicationRecord
  validates :body, presence: true, unless:'image.present?'
  belongs_to :user
  belongs_to :group

  mount_uploader :image, ImageUploader
end
