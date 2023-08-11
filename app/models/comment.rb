class Comment < ApplicationRecord
    belongs_to :user

    validates :movie_id, presence: true
    validates :comment, presence: true
end
