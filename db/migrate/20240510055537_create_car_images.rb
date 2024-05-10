class CreateCarImages < ActiveRecord::Migration[7.1]
  def change
    create_table :car_images do |t|
      t.references :car, null: false, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
