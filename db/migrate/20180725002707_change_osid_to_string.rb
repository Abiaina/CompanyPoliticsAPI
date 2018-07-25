class ChangeOsidToString < ActiveRecord::Migration[5.2]
  def change
    change_column :companies, :open_secret_id, :string
  end
end
