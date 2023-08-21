# frozen_string_literal: true

class AddGenreArrToRents < ActiveRecord::Migration[7.0]
  def change
    add_column :rents, :genre_arr, :string, array: true, default: []
  end
end
