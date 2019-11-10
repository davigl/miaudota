class AnimalSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :age, :adopted, :specie, 
  					 :size, :avatar, :castrated, :gender, :weight
end
