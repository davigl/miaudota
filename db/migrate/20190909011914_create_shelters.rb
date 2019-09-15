class CreateShelters < ActiveRecord::Migration[5.2]
  def change
    create_table :shelters do |t|
      t.string :name
      t.string :state
      t.string :city
      t.string :street
      t.string :neighborhood
      t.string :number
      t.string :complement
      t.string :reference
      t.float :latitude
      t.float :longitude
      t.references :user, polymorphic: true

      t.timestamps
    end
  end
end
