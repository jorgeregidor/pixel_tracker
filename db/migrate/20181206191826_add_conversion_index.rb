class AddConversionIndex < ActiveRecord::Migration[5.1]
  def change
  	add_index :conversions, [:pixel_id, :ip, :user_agent], unique: true
  end
end
