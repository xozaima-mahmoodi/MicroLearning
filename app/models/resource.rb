class Resource < ApplicationRecord
  belongs_to :concept

  enum :resource_type, { book: 0, article: 1, video: 2, course: 3, paper: 4 }

  validates :title, presence: true
  validates :link, presence: true
  validates :resource_type, presence: true
  validates :position, numericality: { only_integer: true }
end
