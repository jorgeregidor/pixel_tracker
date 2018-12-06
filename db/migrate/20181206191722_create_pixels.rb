class CreatePixels < ActiveRecord::Migration[5.1]
  def change
    create_table :pixels do |t|
      t.string :name
      t.references :provider, foreign_key: true

      t.timestamps
    end
  end
end
