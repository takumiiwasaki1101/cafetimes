class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Association
  has_many :coffees
  has_many :reviews

  # 正規表現を変数設定
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze

  with_options presence: true do
    validates_format_of :password, with: PASSWORD_REGEX, message: 'は英数字混合で入力してください'
    validates :nickname
  end
end
