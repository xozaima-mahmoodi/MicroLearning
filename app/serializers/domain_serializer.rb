class DomainSerializer
  include JSONAPI::Serializer

  attributes :slug, :name, :description, :position, :color, :icon
end
