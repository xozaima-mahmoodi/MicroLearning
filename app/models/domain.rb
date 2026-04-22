class Domain < ApplicationRecord
  extend FriendlyId
  include PersianSluggable

  friendly_id :name, use: [ :slugged, :history ]

  has_many :concepts, -> { order(:position, :difficulty_level, :id) }, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
  validates :position, numericality: { only_integer: true }

  scope :ordered, -> { order(:position, :id) }
end
