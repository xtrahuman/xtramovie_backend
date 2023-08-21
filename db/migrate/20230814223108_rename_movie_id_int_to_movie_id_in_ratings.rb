# frozen_string_literal: true

class RenameMovieIdIntToMovieIdInRatings < ActiveRecord::Migration[7.0]
  def change
    rename_column :ratings, :movie_id_int, :movie_id
  end
end
