class CategorySerializer
  include JSONAPI::Serializer

  attributes :slug, :title, :position, :color, :icon

  # Sum of concepts across all child domains. Relies on `domains: :concepts`
  # being preloaded by the controller so this stays N+1-free.
  attribute :concepts_count do |category|
    category.domains.sum { |d| d.concepts.size }
  end

  attribute :domains do |category|
    # `category.domains` is already ordered by the association scope; calling
    # `.order` again would issue a fresh query and bypass the preload.
    category.domains.map do |d|
      {
        id: d.id.to_s,
        slug: d.slug,
        name: d.name,
        description: d.description,
        position: d.position,
        color: d.color,
        icon: d.icon,
        concepts_count: d.concepts.size
      }
    end
  end
end
