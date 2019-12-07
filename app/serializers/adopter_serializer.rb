# frozen_string_literal: true

class AdopterSerializer < ActiveModel::Serializer
  attributes :name, :email, :phone_number, :thumbnail, :state, :city, :photos, :count_adoptions

  has_one :questionnarie

  def photos
    Post.posts_adopter(object.id)
  end

  def email
    object.user.email
  end

  def count_adoptions
    object.adoptions.count
  end
end
