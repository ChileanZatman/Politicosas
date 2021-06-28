class Politician < ApplicationRecord
  has_one_attached :picture
  belongs_to :political_party
  has_many :news, as: :origin
end
