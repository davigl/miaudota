class CreateAdopters < ActiveRecord::Migration[5.2]
  def change
    create_table :adopters do |t|
      t.string :name
      t.string :thumbnail
      t.float :latitude
      t.float :longitude
      t.string :city
      t.string :state
      t.string :phone_number
      t.references :user, polymorphic: true

      t.timestamps
    end
  end
end
