# frozen_string_literal: true

class RemoveGenreFromRents < ActiveRecord::Migration[7.0]
  def change
    remove_column :rents, :genre, :string
  end
end
