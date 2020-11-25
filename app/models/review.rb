class Review < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :tool

  # Association
  belongs_to :user
  belongs_to :coffee

  # Validation
  ## 入力必須に関するvalidation
  with_options presence: true do
    validates :date
    validates :review
  end
end
