class Card < ApplicationRecord

  validates :fci, presence: true
  validates :origin, presence: true
  validates :life_expectancy, presence: true
  validates :fur, presence: true
  validates :min_height, presence: true
  validates :max_height, presence: true
  validates :min_weight, presence: true
  validates :max_weight, presence: true

  ANIMAL = [
    'chien',
    'chat',
    'rongeur'
  ]

  # def specs_check
  #   self.specificities.each do |key, value|

  #   end
  # end
end
