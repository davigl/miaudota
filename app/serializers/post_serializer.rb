# frozen_string_literal: true

class PostSerializer < ActiveModel::Serializer
  attributes :id, :thumbnail, :description

  has_one :adopter

  def id
    object.id.to_s
  end
end
