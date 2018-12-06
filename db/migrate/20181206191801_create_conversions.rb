class CreateConversions < ActiveRecord::Migration[5.1]
  def change
    create_table :conversions do |t|
      t.string :ip
      t.string :user_agen
      t.references :pixel, foreign_key: true

      t.timestamps
    end
  end
end
