class ChangeUseragentName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :conversions, :user_agen, :user_agent
  end
end
