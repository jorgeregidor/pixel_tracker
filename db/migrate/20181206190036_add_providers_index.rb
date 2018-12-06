class AddProvidersIndex < ActiveRecord::Migration[5.1]
  def change
  	add_index :providers, [:user_id, :name], unique: true
  end
end
