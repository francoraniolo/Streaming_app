class LibraryItemSerializer < ActiveModel::Serializer
  attributes :id,
             :expires_at,
             :created_at

  belongs_to :product, serializer: ProductSerializer
end
