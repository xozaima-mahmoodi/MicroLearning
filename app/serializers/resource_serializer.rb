class ResourceSerializer
  include JSONAPI::Serializer

  attributes :title, :author, :link, :position
  attribute :resource_type, &:resource_type
end
