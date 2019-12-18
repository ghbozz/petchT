class Section < ApplicationRecord
  # before_save :format_title
  # before_update :format_title

  belongs_to :brand
  has_many :paragraphs, dependent: :destroy

  accepts_nested_attributes_for :paragraphs, reject_if: :all_blank, allow_destroy: true

  validates :title, presence: true

  def format_link
    self.title.gsub(' ', '-')
  end

  def get_paragraphs
    self.paragraphs.sort_by(&:created_at)
  end

  def format_title
    # self.update(title: self.title.gsub(/\W/, ' ').strip)
  end
end
