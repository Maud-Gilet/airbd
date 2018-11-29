class Comic < ApplicationRecord
  has_many :albums

  include PgSearch
  pg_search_scope :search_by_title,
    against: [:title],
    using: {
      tsearch: { prefix: true }
    }
end
