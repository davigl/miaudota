class AdopterSerializer < ActiveModel::Serializer
	attributes :name, :thumbnail, :state, :city, :photos

	def photos
		Post.posts_adopter(object.id)
	end
end