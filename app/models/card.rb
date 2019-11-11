class Card < ApplicationRecord

  # validates :origin, presence: true
  # validates :life_expectancy, presence: true
  # validates :min_height, presence: true
  # validates :max_height, presence: true
  # validates :min_weight, presence: true
  # validates :max_weight, presence: true
  # validates :title, presence: true
  # validates :body, presence: true

  def set_specificities(params)
    params[:specs].each do |key, value|
      self.specificities[key] = value
    end
    params[:caracs].each do |key, value|
      self.specificities[key] = value
    end
  end

  ANIMAL = [
    'chien',
    'chat',
    'rongeur'
  ]

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
