class AnimalSerializer < ActiveModel::Serializer
  include ActionView::Helpers::DateHelper

  attributes :id, :name, :description, :age, :adopted, :specie, 
  					 :size, :avatar, :castrated, :gender, :weight, :created

  def created
    distance_of_time_in_words(object.created_at, Time.now)
  end

  def id
    object.id.to_s
  end
end
