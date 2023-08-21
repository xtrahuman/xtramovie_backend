# frozen_string_literal: true

class RemoveMovieIdFromBuys < ActiveRecord::Migration[7.0]
  def change
    remove_column :buys, :movie_id, :string
  end
end
