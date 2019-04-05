class Answer < ApplicationRecord
  belongs_to :question
  validates :description, presence: true, length: { maximum: 140 }
end
