class Paragraph < ApplicationRecord
  belongs_to :section

  has_one_attached :thumbnail
end
