class Paragraph < ApplicationRecord
  belongs_to :section

  has_one_attached :thumbnail

  validates :thumbnail, presence: true
  validates :body, presence: true

  def changed_for_autosave?
    super || !attachment_changes.empty?
  end
end
