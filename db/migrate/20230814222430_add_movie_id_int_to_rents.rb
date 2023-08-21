# frozen_string_literal: true

class AddMovieIdIntToRents < ActiveRecord::Migration[7.0]
  def change
    add_column :rents, :movie_id_int, :integer
  end
end
