class LibraryItem < ApplicationRecord
  belongs_to :user
  belongs_to :product, polymorphic: true
  belongs_to :purchase

  def expired?
    expires_at > Time.current
  end

  def self.cache_key
    "#{user.id}_#{maximum(:updated_at)}"
  end
end
