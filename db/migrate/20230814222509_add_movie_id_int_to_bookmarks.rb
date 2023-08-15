class AddMovieIdIntToBookmarks < ActiveRecord::Migration[7.0]
  def change
    add_column :bookmarks, :movie_id_int, :integer
  end
end
