class Article < ApplicationRecord
  before_save :tags_validation

  acts_as_taggable

  belongs_to :user
  has_many :article_tags, dependent: :destroy
  has_many :tags, through: :article_tags

  has_one_attached :thumbnail

  validates :title, presence: true
  validates :subtitle, presence: true
  validates :body, presence: true
  validates :animal, presence: true
  validates :theme, presence: true
  validates :thumbnail, presence: true

  THEMES = %w(Santé Alimentation Education Soins Beauté Hygiène)
  ANIMALS = %w(Chiens Chats Rongeurs)
  STATUS = %w(draft published submitted)

  validates :theme, inclusion: { in: THEMES }
  validates :animal, inclusion: { in: ANIMALS }
  validates :status, inclusion: { in: STATUS }

  ANIMALS_ICONS = {
    'Chiens': '<i class="fas fa-dog"></i>',
    'Chats': '<i class="fas fa-cat"></i>',
    'Rongeurs': '<i class="fas fa-horse"></i>',
    'Reptiles': '<i class="fas fa-frog"></i>',
    'Oiseaux': '<i class="fas fa-crow"></i>'
  }

  include PgSearch::Model
  pg_search_scope :search_articles,
    against: [ :title, :subtitle, :body ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  def author_name
    return "#{self.user.first_name} #{self.user.last_name}"
  end

  def tags_validation
    self.tag_list.reject!.with_index { |tag, index| index > 4 }
  end
end

