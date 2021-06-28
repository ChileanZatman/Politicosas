class PoliticalParty < ApplicationRecord
  has_one_attached :picture
  has_many :news, as: :origin
  has_many :politicians
end
