class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  before_save :tags_validation

  acts_as_taggable_on :tags

  belongs_to :user
  belongs_to :animal

  has_one_attached :thumbnail

  validates :title, presence: true
  validates :subtitle, presence: true
  validates :body, presence: true
  # validates :animal, presence: true
  validates :theme, presence: true
  validates :thumbnail, presence: true

  THEMES = ['adoption', 'alimentation', 'au quotidien', 'education', 'entretien', 'loisir', 'santé']
  STATUS = %w(draft published submitted)

  validates :theme, inclusion: { in: THEMES }
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

  def tags_validation
    self.tag_list.reject!.with_index { |tag, index| index > 4 }
  end

  def get_date
    I18n.l(self.created_at, format: "%B %Y", locale: :'fr').capitalize
  end

  def get_url
    "http://localhost:3000/articles/#{self.id}"
  end

  def should_generate_new_friendly_id?
    title_changed?
  end
end

