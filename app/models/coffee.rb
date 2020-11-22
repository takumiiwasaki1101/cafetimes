class Coffee < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :country

  # Association
  belongs_to :user
  has_many :reviews

  # Validation
  ## 入力必須に関するvalidation
  with_options presence: true do
    validates :name
    validates :country_id
    validates :date_of_purchase
    validates :shop
  end

  ## id0以外での入力を必須とするvalidation
  with_options numericality: { other_than: 0, message: 'Select' } do
    validates :country_id
  end
end
