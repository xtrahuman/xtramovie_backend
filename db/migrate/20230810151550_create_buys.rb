class CreateBuys < ActiveRecord::Migration[7.0]
  def change
    create_table :buys do |t|
      t.float :price
      t.string :movie_id
      t.string :movie_name
      t.string :release_date
      t.string :backdrop_path
      t.string :image_url
      t.string :genre
      t.text :summary
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
