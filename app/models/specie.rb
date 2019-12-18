class Specie < ApplicationRecord
  belongs_to :animal
  has_one :card
end
