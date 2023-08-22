class EpisodeSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :plot,
             :number
end
