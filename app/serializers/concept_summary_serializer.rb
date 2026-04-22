class ConceptSummarySerializer
  include JSONAPI::Serializer

  set_type :concept

  attributes :slug, :title, :brief_summary, :position
  attribute :difficulty_level, &:difficulty_level
end
