class DomainSerializer
  include JSONAPI::Serializer

  attributes :slug, :name, :description, :position, :color, :icon

  attribute :concepts_count do |domain|
    domain.concepts.size
  end
end
