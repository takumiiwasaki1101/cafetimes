class CreateCoffees < ActiveRecord::Migration[6.0]
  def change
    create_table :coffees do |t|
      t.string     :name,            null:false
      t.integer    :country_id,      null:false
      t.date       :date_of_purchase,   null:false
      t.string     :shop,            null:false
      t.text       :detail          
      t.references :user,            foreign_key: true      
      t.timestamps
    end
  end
end
