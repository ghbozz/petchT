class Paragraph < ApplicationRecord
  belongs_to :section

  has_one_attached :thumbnail

  validates :thumbnail, presence: true
  validates :body, presence: true
end
