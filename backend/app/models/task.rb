class Task < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :status, inclusion: { in: %w[Pending InProgress Completed] }
end
