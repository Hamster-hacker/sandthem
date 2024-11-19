# rubocop:disable Metrics/MethodLength
class CreateDreams < ActiveRecord::Migration[7.1]
  def change
    create_table :dreams do |t|
      t.string :title
      t.text :description
      t.string :category
      t.string :image_url
      t.decimal :price
      t.integer :duration
      t.decimal :rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
# rubocop:enable Metrics/MethodLength
