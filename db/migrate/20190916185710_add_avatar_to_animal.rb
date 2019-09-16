class AddAvatarToAnimal < ActiveRecord::Migration[5.2]
  def change
    add_column :animals, :avatar, :string
  end
end
