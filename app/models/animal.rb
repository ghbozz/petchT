class Animal < ApplicationRecord
  has_many :species, :class_name => 'Specie'
  has_many :articles
  has_many :cards
  has_many :targets, dependent: :destroy
  has_many :brands, through: :targets

  THEMES = {
    chien: ['adoption', 'alimentation', 'education', 'au quotidien', 'santé', 'loisir', 'entretien'],
    chat: ['adoption', 'alimentation', 'education', 'au quotidien', 'santé', 'loisir', 'entretien'],
    rongeur: ['adoption', 'alimentation', 'au quotidien', 'santé', 'loisir', 'entretien']
  }

  SPECS = {
    chien: {
      fci: [
        'groupe 1',
        'groupe 2',
        'groupe 3',
        'groupe 4',
        'groupe 5',
        'groupe 6',
        'groupe 7',
        'groupe 8',
        'groupe 9',
        'groupe 10'
      ],
      taille: %w(toy petit moyen grand geant),
      type_de_poil: %w(nue ras court mi-long long)
    },
    chat: {
      type_de_poil: %w(nue ras court mi-long long)
    },
    rongeur: {
      mode_de_vie: %w(diurne nocturne),
      alimentation: %w(herbivore omnivore carnivore),
      comportement: %w(sociable solitaire)
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
      'joueur',
    ],
    chat: [
      'entretien du poil',
      'besoin d\'exercice',
      'vie en appartement',
      'adapté aux enfants',
      'facile d\'entretien',
      'santé',
      'indépendant',
      'joueur',
      'calme',
    ],
    rongeur: [
      'adapté aux enfants',
      'cout de l\'entretien',
      'santé',
      'vit à plusieurs',
      'joueur',
      'calme',
    ]
  }
end
