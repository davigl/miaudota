# frozen_string_literal: true

class Animal < ApplicationRecord
  validates :breed, :name, :specie, presence: true

  belongs_to :shelter
end
