class Rent < ApplicationRecord
  belongs_to :user

  validates :user_id, uniqueness: { scope: :movie_id, message: 'movie already bought by user' }
  validates :movie_id, presence: true,
  validates :movie_name, presence: true
  validates :price, presence: true
  validates :image_url, presence: true
  validates :backdrop_path, presence: true
end
