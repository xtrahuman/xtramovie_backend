# frozen_string_literal: true

class RenameMovieIdIntToMovieIdInComments < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :movie_id_int, :movie_id
  end
end
