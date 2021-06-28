class News < ApplicationRecord
  belongs_to :origin, polymorphic: true
end
