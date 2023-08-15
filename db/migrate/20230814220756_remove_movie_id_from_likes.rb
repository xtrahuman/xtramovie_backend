class RemoveMovieIdFromLikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :movie_id, :string
  end
end
