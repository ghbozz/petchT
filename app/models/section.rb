class Section < ApplicationRecord
  belongs_to :brand
  has_many :paragraphs, dependent: :destroy

  accepts_nested_attributes_for :paragraphs, reject_if: :all_blank, allow_destroy: true

  def formatted_title
    self.title.gsub(' ', '-')
  end
end
