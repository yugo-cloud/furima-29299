class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :comments
  has_many :order

  with_options presence: true do
    validates :nickname
    PASSWORD_REGEX = /\A[ぁ-んァ-ン一-龥]/
    validates :family_name, format: { with: PASSWORD_REGEX ,message: "は全角で入力して下さい"}
    validates :first_name, format: { with: PASSWORD_REGEX ,message: "は全角で入力して下さい"}
    PASSWORD_REGEX2 = /\A[ァ-ヶー－]+\z/
    validates :family_name_kana, format: { with: PASSWORD_REGEX2 ,message: "は全角で入力して下さい"}
    validates :first_name_kana, format: { with: PASSWORD_REGEX2 ,message: "は全角で入力して下さい"}
    validates :birth_day
  end

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true,format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i ,message: "を半角で入力して下さい
    "}, length: { minimum: 6 }
end