class Card < ApplicationRecord
  has_one_attached :thumbnail

  belongs_to :specie
  belongs_to :animal

  STATUS = %w(draft published submitted)

  validates :status, inclusion: { in: STATUS }
  validates :thumbnail, presence: true
  # validates :title, presence: true
  validates :body, presence: true
  validates :origin, presence: true
  validates :life_expectancy, presence: true
  validates :min_height, presence: true
  validates :max_height, presence: true
  validates :min_weight, presence: true
  validates :max_weight, presence: true


  def set_specs_and_ratings(params)
    params[:specs].each do |key, value|
      self.specificities[key] = value
    end
    params[:ratings].each do |key, value|
      value == '' ? self.ratings[key] = 0 : self.ratings[key] = value.to_i
    end
  end

end
