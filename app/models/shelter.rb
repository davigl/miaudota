# frozen_string_literal: true

class Shelter < ApplicationRecord
  belongs_to :user, polymorphic: true
  has_many :animals

  def animals_filter_species(species)
  	animals_output = animals.where(specie: species)
  end

  def animals_filter_sizes(sizes)
  	animals_output = animals.where(size: sizes)
  end

  def adopted_animals(adopted)
  	animals.where(adopted: adopted).count
  end

  def registered_animals_size
    animals.size
  end
end
