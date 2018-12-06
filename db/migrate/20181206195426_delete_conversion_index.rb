class DeleteConversionIndex < ActiveRecord::Migration[5.1]
  def change
  	remove_index :conversions, name: "index_conversions_on_pixel_id_and_ip_and_user_agent"
  end
end
