class Adopter < ApplicationRecord
  belongs_to :user

  def upload_image(image)
      image = Cloudinary::Uploader.upload(image)
      secure_url = image['secure_url']
  end
end
