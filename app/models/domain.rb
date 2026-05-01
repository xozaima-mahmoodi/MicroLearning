class Domain < ApplicationRecord
  extend FriendlyId
  extend Mobility
  include PersianSluggable

  translates :name,        type: :string
  translates :description, type: :text

  friendly_id :name, use: [ :slugged, :history ]

  belongs_to :category, optional: true
  has_many :concepts, -> { order(:position, :difficulty_level, :id) }, dependent: :destroy

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :position, numericality: { only_integer: true }

  scope :ordered, -> { order(:position, :id) }
end
