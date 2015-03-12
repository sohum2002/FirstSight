class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :first_name
      t.text :last_name
      t.text :about
      t.date :birthday
      t.integer :latitude
      t.integer :longitude
      t.text :occupation
      t.text :field
      t.text :orientation
      t.text :interest
      t.text :physical
      t.text :free_time

      t.timestamps null: false
    end
  end
end
