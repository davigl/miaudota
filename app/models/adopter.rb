class Adopter < ApplicationRecord
  belongs_to :user, polymorphic: true

  def upload_image(file)
    image = Cloudinary::Uploader.upload(file)
    secure_url = image['secure_url']
  end
end
