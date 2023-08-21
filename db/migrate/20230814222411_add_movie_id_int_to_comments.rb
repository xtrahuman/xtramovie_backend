# frozen_string_literal: true

class AddMovieIdIntToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :movie_id_int, :integer
  end
end
