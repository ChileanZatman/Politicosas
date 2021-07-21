class News < ApplicationRecord
  self.per_page = 4
  belongs_to :origin, polymorphic: true
end
