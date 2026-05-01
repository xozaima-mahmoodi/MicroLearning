class Concept < ApplicationRecord
  extend FriendlyId
  extend Mobility
  include PersianSluggable

  translates :title,            type: :string
  translates :brief_summary,    type: :text
  translates :extended_content, type: :text

  friendly_id :title, use: [ :slugged, :history ]

  belongs_to :domain

  has_many :resources, -> { order(:position, :id) }, dependent: :destroy

  has_many :prerequisite_links,
    class_name: "ConceptRelation",
    foreign_key: :target_concept_id,
    dependent: :destroy,
    inverse_of: :target_concept
  has_many :prerequisites, through: :prerequisite_links, source: :source_concept

  has_many :next_step_links,
    class_name: "ConceptRelation",
    foreign_key: :source_concept_id,
    dependent: :destroy,
    inverse_of: :source_concept
  has_many :next_steps, through: :next_step_links, source: :target_concept

  enum :difficulty_level, { beginner: 0, intermediate: 1, advanced: 2, expert: 3 }

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :position, numericality: { only_integer: true }
  validates :difficulty_level, presence: true
end
