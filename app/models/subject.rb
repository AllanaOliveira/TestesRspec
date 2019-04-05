class Subject < ApplicationRecord
  has_many :questions
  validates :description, presence: true, length: { maximum: 140 }
end
