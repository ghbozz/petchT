class Article < ApplicationRecord
  belongs_to :user

  has_one_attached :thumbnail

  validates :title, presence: true
  validates :subtitle, presence: true
  validates :body, presence: true
  validates :animal, presence: true
  validates :theme, presence: true
  validates :thumbnail, presence: true

  THEMES = %w(Santé Alimentation Education Soins Beauté Hygiène)
  ANIMALS = %w(Chiens Chats Rongeurs Reptiles Oiseaux)
  STATUS = %w(draft published submitted)

  validates :theme, inclusion: { in: THEMES }
  validates :animal, inclusion: { in: ANIMALS }
  validates :status, inclusion: { in: STATUS }

  include PgSearch::Model
  pg_search_scope :search_articles,
    against: [ :title, :subtitle, :body ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  def author_name
    return "#{self.user.first_name} #{self.user.last_name}"
  end
end

