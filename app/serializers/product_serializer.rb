class ProductSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :plot,
             :created_at

  attribute :number, if: :season?

  has_many :episodes, serializer: EpisodeSerializer, if: :season?

  def season?
    object.is_a?(Season)
  end
end
