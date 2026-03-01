class Todo < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true

  scope :completed, -> { where(completed: true) }
  scope :pending,   -> { where(completed: false) }
end
