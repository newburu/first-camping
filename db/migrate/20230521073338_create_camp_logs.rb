class CreateCampLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :camp_logs do |t|
      t.references :camp_site, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :start_day
      t.date :end_day
      t.json :images
      t.text :detail

      t.timestamps
    end
  end
end
