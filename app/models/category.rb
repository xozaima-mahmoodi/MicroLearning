class Category < ApplicationRecord
  extend FriendlyId
  extend Mobility
  include PersianSluggable

  translates :title, type: :string

  friendly_id :title, use: [ :slugged, :history ]

  has_many :domains, -> { order(:position, :id) }, dependent: :nullify

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :position, numericality: { only_integer: true }

  scope :ordered, -> { order(:position, :id) }
end
