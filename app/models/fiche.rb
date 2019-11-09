class Fiche < ApplicationRecord
  belongs_to :user

  STATUS = %w(draft published submitted)
  ANIMALS = %w(Chiens Chats Rongeurs Reptiles Oiseaux)

  validates :title, presence: true
  validates :description, presence: true
  validates :animal, inclusion: { in: ANIMALS }
  validates :status, inclusion: { in: STATUS }
  validates :race, presence: true
  validates :origin, presence: true

  ANIMALS_ICONS = {
    'Chiens': '<i class="fas fa-dog"></i>',
    'Chats': '<i class="fas fa-cat"></i>',
    'Rongeurs': '<i class="fas fa-horse"></i>',
    'Reptiles': '<i class="fas fa-frog"></i>',
    'Oiseaux': '<i class="fas fa-crow"></i>'
  }

end
