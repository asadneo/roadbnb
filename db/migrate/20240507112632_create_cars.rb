class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.string :year
      t.string :img_url
      t.references :user, null: false, foreign_key: true  # Uses references for the foreign key
      t.timestamps
    end
  end
end
