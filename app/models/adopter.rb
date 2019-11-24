class Adopter < ApplicationRecord
  belongs_to :user, polymorphic: true
  has_many :appliances
  has_many :adoptions
  has_one :questionnarie

  def upload_image(file)
    image = Cloudinary::Uploader.upload(file)
    secure_url = image['secure_url']
  end

  def check_already_applied(adoption_params)
  	appliances.where(adoption_params).any?
  end
end
