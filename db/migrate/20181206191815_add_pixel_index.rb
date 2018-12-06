class AddPixelIndex < ActiveRecord::Migration[5.1]
  def change
  	add_index :pixels, [:providers_id, :name], unique: true
  end
end
