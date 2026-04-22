class ConceptRelation < ApplicationRecord
  belongs_to :source_concept, class_name: "Concept"
  belongs_to :target_concept, class_name: "Concept"

  validates :source_concept_id, uniqueness: { scope: :target_concept_id }
  validate :no_self_loop

  private

  def no_self_loop
    return if source_concept_id.blank? || target_concept_id.blank?
    errors.add(:target_concept_id, "cannot equal source_concept_id") if source_concept_id == target_concept_id
  end
end
