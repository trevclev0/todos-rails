# TODO: Create the Todo model
class Todo < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true

  # 3. Scopes (Optional but helpful)
  # Allows you to call Todo.completed or Todo.pending
  scope :completed, -> { where(completed: true) }
  scope :pending,   -> { where(completed: false) }
end
