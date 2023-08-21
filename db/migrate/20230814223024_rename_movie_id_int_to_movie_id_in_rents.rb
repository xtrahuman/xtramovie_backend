# frozen_string_literal: true

class RenameMovieIdIntToMovieIdInRents < ActiveRecord::Migration[7.0]
  def change
    rename_column :rents, :movie_id_int, :movie_id
  end
end
