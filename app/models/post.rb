# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :adopter

  def self.posts_adopter(id)
    where(adopter_id: id).select(:id, :thumbnail, :description)
  end
end
