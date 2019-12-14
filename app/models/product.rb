class Product < ApplicationRecord
  belongs_to :brand

  has_one_attached :thumbnail

  validates :name, presence: true
  validates :thumbnail, presence: true
end
