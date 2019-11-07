class Tag < ApplicationRecord
  has_many :article_tags, dependent: :destroy
  has_many :articles, through: :article_tags

  NAMES = [
    'accessoires',
    'adoption',
    'allergies',
    'arbre à chat',
    'cage',
    'chaton',
    'chiot',
    'clapier',
    'croquettes',
    'entretien',
    'friandises',
    'sport',
    'puces',
    'tiques'
  ]
end
