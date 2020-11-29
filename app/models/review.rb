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

  ## 数字入力に関するvalidation
  with_options numericality: { with: /\A[0-9]+\z/, message: '半角数字で入力してください' } do
    validates :amount_of_coffee, allow_nil: true
    validates :amount_of_water, allow_nil: true
    validates :pre_infusion_time, allow_nil: true
    validates :extraction_time, allow_nil: true    
  end

end
