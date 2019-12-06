# frozen_string_literal: true

class Animal < ApplicationRecord
  validates :name, :specie, :gender, :avatar, presence: true
  validates :castrated, inclusion: { in: [true, false] }
  paginates_per 10

  belongs_to :shelter
  has_many :appliances

  def self.upload_image(param)
    image = Cloudinary::Uploader.upload(param)
    secure_url = image['secure_url']
  end

  def changes_to_adopted(id)
  	self.update_attributes(adopted: true)

  	appliances.where.not(id: id).update_all(status: :rejected)
  end
end
