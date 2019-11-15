class Animal < ApplicationRecord
  has_many :species, :class_name => 'Specie'


  # ANIMALS = %w(chien chat rongeur)
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
