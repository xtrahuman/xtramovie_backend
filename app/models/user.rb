# frozen_string_literal: true

class User < ApplicationRecord
  #   before_create :set_slug

  has_secure_password
  enum role: %i[user admin]
  has_many :buy, dependent: :destroy
  has_many :rent, dependent: :destroy
  has_many :bookmark, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :ratings, dependent: :destroy

  validates :password, presence: true, length: { minimum: 8 }, confirmation: true, on: :create
  validates :email, presence: true, uniqueness: { message: 'Email already taken' }
  validates :username, presence: true, uniqueness: { message: 'username already taken' }
  validates :firstname, presence: true
  validates :lastname, presence: true

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(validate: false)
  end

  def full_name
    "#{firstname} #{lastname}".strip
  end

  #   def set_slug
  #     self.slug = "#{full_name.parameterize}-#{SecureRandom.hex(2)}"
  #   end
end
