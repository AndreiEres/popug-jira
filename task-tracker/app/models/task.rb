# frozen_string_literal: true

class Task < ApplicationRecord
  validates :description, presence: true
  enum status: { active: 0, completed: 1 }

  scope :for_popug, ->(id) { where(popug_id: id).order(created_at: :desc) }
end
