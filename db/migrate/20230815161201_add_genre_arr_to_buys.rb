# frozen_string_literal: true

class AddGenreArrToBuys < ActiveRecord::Migration[7.0]
  def change
    add_column :buys, :genre_arr, :string, array: true, default: []
  end
end
