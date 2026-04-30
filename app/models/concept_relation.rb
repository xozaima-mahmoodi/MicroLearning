require "set"

class ConceptRelation < ApplicationRecord
  belongs_to :source_concept, class_name: "Concept"
  belongs_to :target_concept, class_name: "Concept"

  validates :source_concept_id, uniqueness: { scope: :target_concept_id }
  validate :no_self_loop
  validate :no_circular_dependency

  private

  def no_self_loop
    return if source_concept_id.blank? || target_concept_id.blank?
    errors.add(:target_concept_id, "cannot equal source_concept_id") if source_concept_id == target_concept_id
  end

  # Adding an edge source -> target closes a cycle iff a path target -> ... -> source
  # already exists. BFS from target along outgoing edges and look for source.
  def no_circular_dependency
    return if source_concept_id.blank? || target_concept_id.blank?
    return if source_concept_id == target_concept_id

    visited = Set.new
    queue   = [ target_concept_id ]

    until queue.empty?
      current = queue.shift
      next if visited.include?(current)
      visited << current

      next_ids = ConceptRelation
                   .where(source_concept_id: current)
                   .where.not(id: id)
                   .pluck(:target_concept_id)

      if next_ids.include?(source_concept_id)
        errors.add(:base, "creates a circular prerequisite dependency")
        return
      end

      queue.concat(next_ids - visited.to_a)
    end
  end
end
