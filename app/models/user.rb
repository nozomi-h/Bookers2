class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :books, dependent: :destroy
  attachment :profile_image

  # 登録時にメールアドレスを不要とする
  def email_required?
  	false
  end

  def email_changed?
  	false
  end

  # 空白登録を阻止
  validates :name, presence: true, length: { in: 2..20 }
  validates :email, presence: true
  validates :introduction, length: { maximum: 50 }
end
