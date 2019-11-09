class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles

  has_one_attached :avatar

  validates :avatar, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :profession, presence: true
  validates :signature, presence: true

  def is_admin?
    self.permission == 'admin'
  end

  def is_writter?
    self.permission == 'writter'
  end

  def is_author?(article)
    article.user == self
  end
end
