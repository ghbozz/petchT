class Article < ApplicationRecord
  belongs_to :user

  has_one_attached :thumbnail

  validates :title, presence: true
  validates :subtitle, presence: true
  validates :body, presence: true
  validates :animal, presence: true
  validates :theme, presence: true

  THEMES = %w(Santé Alimentation Education Soins Beauté Hygiène)
  ANIMALS = %w(Chiens Chats Rongeurs Reptiles Oiseaux)
  STATUS = %w(draft published)

  validates :theme, inclusion: { in: THEMES }
  validates :animal, inclusion: { in: ANIMALS }
  validates :status, inclusion: { in: STATUS }

  def author_name
    return "#{self.user.first_name} #{self.user.last_name}"
  end
end

