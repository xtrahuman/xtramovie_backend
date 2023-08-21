# frozen_string_literal: true

class RenameMovieIdIntToMovieIdInLikes < ActiveRecord::Migration[7.0]
  def change
    rename_column :likes, :movie_id_int, :movie_id
  end
end
