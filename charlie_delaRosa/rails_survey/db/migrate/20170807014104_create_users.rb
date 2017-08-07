class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :dojo_location
      t.string :fav_lang
      t.text :comment

      t.timestamps null: false
    end
  end
end
