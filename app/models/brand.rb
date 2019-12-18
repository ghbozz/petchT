class Brand < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :targets, dependent: :destroy
  has_many :animals, through: :targets
  has_many :products, dependent: :destroy
  has_many :sections, dependent: :destroy

  accepts_nested_attributes_for :sections, reject_if: :all_blank, allow_destroy: true

  has_one_attached :logo
  has_one_attached :banner

  validates :name, presence: true
  validates :description, presence: true
  validates :logo, presence: true
  validates :banner, presence: true

  include PgSearch::Model
  pg_search_scope :brands_search,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }

  def set_targets(params)
    params[:targets].each do |key, value|
      if value == '1' && !self.animals.find_by(name: key)
        Target.create(brand: self, animal: Animal.find_by(name: key))
      elsif value == '0' && self.animals.find_by(name: key)
        self.targets.find_by(animal: Animal.find_by(name: key)).destroy
      end
    end
  end

  def should_generate_new_friendly_id?
    name_changed?
  end
end
