class CategorySerializer
  include JSONAPI::Serializer

  attributes :slug, :title, :position, :color, :icon

  attribute :domains do |category|
    category.domains.order(:position, :id).map do |d|
      {
        id: d.id.to_s,
        slug: d.slug,
        name: d.name,
        description: d.description,
        position: d.position,
        color: d.color,
        icon: d.icon
      }
    end
  end
end
