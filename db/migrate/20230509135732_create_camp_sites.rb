class CreateCampSites < ActiveRecord::Migration[7.0]
  def change
    create_table :camp_sites do |t|
      t.string :name
      t.string :address
      t.string :url
      t.text :detail

      t.timestamps
    end
  end
end
