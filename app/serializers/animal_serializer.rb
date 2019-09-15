class AnimalSerializer < ActiveModel::Serializer
	include Rails.application.routes.url_helpers

  attributes :id, :name, :breed, :description, :age, :adopted, :specie, :size, :image_url

  def image_url
  	rails_blob_url(object.image)
  end
end
