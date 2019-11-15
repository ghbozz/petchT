class Animal < ApplicationRecord
  has_many :species, :class_name => 'Specie'
end
