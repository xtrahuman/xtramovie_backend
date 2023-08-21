# frozen_string_literal: true

class RenameMovieIdIntToMovieIdInBookmarks < ActiveRecord::Migration[7.0]
  def change
    rename_column :bookmarks, :movie_id_int, :movie_id
  end
end
