class User < ApplicationRecord
  has_secure_password

  has_many :todos, dependent: :destroy

  normalizes :username, with: ->(username) { username.downcase }

  validates :username,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { minimum: 3, maximum: 30 },
    format: { with: /\A[a-zA-Z0-9_]+\z/, message: "only allows letters, numbers, and underscores" }

  validates :password,
    length: { minimum: 8 },
    format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).*\z/, message: "must include at least one lowercase letter, one uppercase letter, and one number" },
    if: :password_digest_changed?
end
