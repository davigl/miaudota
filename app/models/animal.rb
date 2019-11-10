# frozen_string_literal: true

class Animal < ApplicationRecord
  validates :name, :specie, :castrated, :gender, :avatar, presence: true
  paginates_per 10

  belongs_to :shelter

  def self.upload_image(param)
    image = Cloudinary::Uploader.upload(param)
    secure_url = image['secure_url']
  end
end
