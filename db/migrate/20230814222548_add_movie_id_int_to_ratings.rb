# frozen_string_literal: true

class AddMovieIdIntToRatings < ActiveRecord::Migration[7.0]
  def change
    add_column :ratings, :movie_id_int, :integer
  end
end
