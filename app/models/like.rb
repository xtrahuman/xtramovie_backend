# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user

  validates :user_id, uniqueness: { scope: :movie_id }
  validates :movie_id, presence: true
end
