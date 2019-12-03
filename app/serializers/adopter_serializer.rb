class AdopterSerializer < ActiveModel::Serializer
	attributes :name, :email, :phone_number, :thumbnail, :state, :city, :photos

	has_one :questionnarie

	def photos
		Post.posts_adopter(object.id)
	end

	def email
		object.user.email
	end
end