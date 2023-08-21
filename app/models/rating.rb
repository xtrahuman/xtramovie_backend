# frozen_string_literal: true

class Rating < ApplicationRecord
  belongs_to :user

  validates :rate, presence: true, inclusion: { in: 1..5 }
  validates :user_id, uniqueness: { scope: :movie_id }
  validates :movie_id, presence: true
end
