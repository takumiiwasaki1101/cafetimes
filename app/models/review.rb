class Review < ApplicationRecord

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