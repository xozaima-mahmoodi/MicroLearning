class ConceptSearchSerializer
  include JSONAPI::Serializer

  set_type :concept

  attributes :slug, :title

  attribute(:domain_slug) { |c| c.domain.slug }
  attribute(:domain_name) { |c| c.domain.name }
end
