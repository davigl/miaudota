class Adopter < ApplicationRecord
  belongs_to :user, polymorphic: true

  def upload_image
    image = Cloudinary::Uploader.upload(self.thumbnail)
    secure_url = image['secure_url']
  end
end
