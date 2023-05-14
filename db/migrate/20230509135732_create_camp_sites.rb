class CreateCampSites < ActiveRecord::Migration[7.0]
  def change
    create_table :camp_sites do |t|
      t.string :name
      t.string :address
      t.string :url
      t.json :images
      t.text :detail
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
