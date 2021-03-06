class Card < ApplicationRecord
  extend FriendlyId
  friendly_id :specie_name, use: :slugged

  before_save :validates_specs
  before_save :validates_ratings

  has_one_attached :thumbnail

  belongs_to :specie
  belongs_to :animal
  belongs_to :user

  STATUS = %w(draft published)

  validates :status, inclusion: { in: STATUS }
  validates :thumbnail, presence: true
  validates :body, presence: true
  validates :origin, presence: true
  validates :life_expectancy, presence: true
  validates :min_height, presence: true
  validates :max_height, presence: true
  validates :min_weight, presence: true
  validates :max_weight, presence: true

  scope :published, -> { where(status: 'published') }

  scope :animal_scope, -> (animal) {
    where(status: 'published', animal: Animal.find_by(name: animal))
  }

  include PgSearch::Model
  pg_search_scope :cards_search,
    against: [ :body ],
    associated_against: {
      specie: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }

  def author_name
    return "#{self.user.first_name} #{self.user.last_name}"
  end

  def set_specs_and_ratings(params)
    params[:specs].each do |key, value|
      self.specificities[key] = value
    end
    params[:ratings].each do |key, value|
      value == '' ? self.ratings[key] = 0 : self.ratings[key] = value.to_i
    end
  end

  def validates_specs
    keys = Animal::SPECS[self.animal.name.to_sym].keys
    self.specificities = self.specificities.slice!(*keys)
  end

  def validates_ratings
    keys = Animal::RATINGS[self.animal.name.to_sym].map(&:to_sym)
    self.ratings = self.ratings.slice!(*keys)
  end

  def specie_name
    self.specie.name
  end

  def should_generate_new_friendly_id?
    true if self.specie
  end

  def get_url
    "https://petch-test.herokuapp.com/fiches/#{self.friendly_id}"
  end

end
