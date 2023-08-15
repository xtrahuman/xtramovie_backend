class RemoveMovieIdFromRents < ActiveRecord::Migration[7.0]
  def change
    remove_column :rents, :movie_id, :string
  end
end
