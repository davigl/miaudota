# frozen_string_literal: true

class Shelter < ApplicationRecord
  belongs_to :user, polymorphic: true
  has_many :animals

  has_one_attached :image

  def registered_animals
    animals.size
  end
end
