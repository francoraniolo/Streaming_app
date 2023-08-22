class LibraryItemSerializer < ActiveModel::Serializer
  attributes :id,
             :expires_at,
             :created_at

  belongs_to :product, polymorphic: true

  def product
    if object.product_type == 'Movie'
      MovieSerializer.new(object.product, root: false)
    elsif object.product_type == 'Season'
      SeasonSerializer.new(object.product, root: false)
    end
  end
end
