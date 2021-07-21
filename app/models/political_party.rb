class PoliticalParty < ApplicationRecord
  self.per_page = 2
  has_one_attached :picture
  has_many :news, as: :origin
  has_many :politicians, :dependent => :delete_all
end
