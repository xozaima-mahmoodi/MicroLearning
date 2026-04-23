class ConceptSerializer
  include JSONAPI::Serializer

  attributes :slug, :title, :brief_summary, :extended_content, :position, :views_count
  attribute :difficulty_level, &:difficulty_level

  attribute :prerequisites do |concept|
    concept.prerequisites.map { |c| ConceptSummarySerializer.new(c).serializable_hash[:data][:attributes].merge(id: c.id.to_s) }
  end

  attribute :next_steps do |concept|
    concept.next_steps.map { |c| ConceptSummarySerializer.new(c).serializable_hash[:data][:attributes].merge(id: c.id.to_s) }
  end

  attribute :resources do |concept|
    concept.resources.map { |r| ResourceSerializer.new(r).serializable_hash[:data][:attributes].merge(id: r.id.to_s) }
  end
end
