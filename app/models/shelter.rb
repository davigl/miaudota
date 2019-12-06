# frozen_string_literal: true

class Shelter < ApplicationRecord
  belongs_to :user, polymorphic: true
  has_many :animals
  has_many :appliances

  validates :street, :number, :city, :state, presence: true

  geocoded_by :address
  after_validation :geocode

  def address
    [street, number, city, state].compact.join(", ")
  end

  # filtering animals

  def animals_filter_species(species)
    animals.where(specie: species)
  end

  def animals_filter_sizes(sizes)
    animals.where(size: sizes)
  end

  def registered_animals_size
    animals.size
  end

  # filtering appliances

  def check_appliances(status)
    appliances.where(status: status)
  end
end
