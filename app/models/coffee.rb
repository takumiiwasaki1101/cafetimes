class Coffee < ApplicationRecord
  def change
    create_table :coffees do |t|
      t.string     :name,            null:false
      t.integer    :country_id,      null:false
      t.date       :purchase_date,   null:false
      t.text       :detail,          null:false
      t.string     :shop,            null:false
      t.text       :detail          
      t.references :user,            foreign_key: true      
      t.timestamps
    end
  end
end
