# frozen_string_literal: true

class RemoveMovieIdFromRatings < ActiveRecord::Migration[7.0]
  def change
    remove_column :ratings, :movie_id, :string
  end
end
