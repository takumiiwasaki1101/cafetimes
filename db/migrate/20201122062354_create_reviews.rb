class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.date       :date,   null:false
      t.text       :review          
      t.references :user,   foreign_key: true      
      t.references :coffee, foreign_key: true      
      t.timestamps
    end
  end
end
