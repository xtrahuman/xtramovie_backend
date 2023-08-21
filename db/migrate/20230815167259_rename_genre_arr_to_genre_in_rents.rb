# frozen_string_literal: true

class RenameGenreArrToGenreInRents < ActiveRecord::Migration[7.0]
  def change
    rename_column :rents, :genre_arr, :genre
  end
end
