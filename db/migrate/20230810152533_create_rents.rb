# frozen_string_literal: true

class CreateRents < ActiveRecord::Migration[7.0]
  def change
    create_table :rents do |t|
      t.float :price
      t.string :movie_id
      t.string :movie_name
      t.string :release_date
      t.string :backdrop_path
      t.string :image_url
      t.string :genre, array: true, default: []
      t.text :summary
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
