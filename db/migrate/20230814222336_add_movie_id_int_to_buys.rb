# frozen_string_literal: true

class AddMovieIdIntToBuys < ActiveRecord::Migration[7.0]
  def change
    add_column :buys, :movie_id_int, :integer
  end
end
