class AddMovieIdIntToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :movie_id_int, :integer
  end
end
