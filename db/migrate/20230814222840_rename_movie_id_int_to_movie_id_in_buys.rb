# frozen_string_literal: true

class RenameMovieIdIntToMovieIdInBuys < ActiveRecord::Migration[7.0]
  def change
    rename_column :buys, :movie_id_int, :movie_id
  end
end
