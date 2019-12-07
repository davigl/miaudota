# frozen_string_literal: true

class ShelterSerializer < ActiveModel::Serializer
  attributes :name, :animals, :distance

  def distance
    object.distance_to(@instance_options[:custom_element]).round(1)
  end

  def animals
    filtered = object.animals.where(adopted: false).shuffle

    filtered.map do |animal|
      ::AnimalSerializer.new(animal).attributes
    end
  end
end
