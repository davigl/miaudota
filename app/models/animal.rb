# frozen_string_literal: true

class Animal < ApplicationRecord
  validates :breed, :name, :specie, presence: true
  paginates_per 10

  belongs_to :shelter

  scope :adopted_animals, -> (adopted) { where(adopted: adopted) }
end
