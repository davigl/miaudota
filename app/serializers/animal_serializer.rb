class AnimalSerializer < ActiveModel::Serializer
  attributes :id, :name, :breed, :description, :age, :adopted, :specie, :size, :avatar
end
