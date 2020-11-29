class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.date       :date,    null:false
      t.integer    :tool_id, null:false
      t.integer    :amount_of_coffee
      t.integer    :amount_of_water 
      t.integer    :pre_infusion_time 
      t.integer    :extraction_time 
      t.text       :review,  null:false          
      t.references :user,    foreign_key: true      
      t.references :coffee,  foreign_key: true      
      t.timestamps
    end
  end
end
