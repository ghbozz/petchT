class Card < ApplicationRecord
  has_one_attached :thumbnail

  belongs_to :specie

  STATUS = %w(draft published submitted)

  validates :status, inclusion: { in: STATUS }
  validates :thumbnail, presence: true
  validates :title, presence: true
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


  ANIMALS = %w(chien chat rongeur)
  SPECS = {
    chien: {
      fci: %w(groupe_1 groupe_2 groupe_3 groupe_4 groupe_5),
      type_de_poil: %w(nue court long)
    },
    chat: {
      type_de_poil: %w(nue court long)
    },
    rongeur: {
      mode_de_vie: %w(diurne nocturne)
    }
  }

  RATINGS = {
    chien: [
      'entretien du poil',
      'besoin d\'exercice',
      'vie en appartement',
      'adapté aux enfants',
      'cout de l\'entretien',
      'santé',
      'indépendant',
      'vit à plusieurs',
      'joueur',
      'calme',
    ],
    chat: [
      'entretien du poil',
      'besoin d\'exercice',
      'vie en appartement',
      'adapté aux enfants',
      'cout de l\'entretien',
      'santé',
      'indépendant',
      'vit à plusieurs',
      'joueur',
      'calme',
    ],
    rongeur: [
      'entretien du poil',
      'besoin d\'exercice',
      'vie en appartement',
      'adapté aux enfants',
      'cout de l\'entretien',
      'santé',
      'indépendant',
      'vit à plusieurs',
      'joueur',
      'calme',
    ]
  }

end
