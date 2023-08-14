# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :movie_id
      t.text :comment
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
