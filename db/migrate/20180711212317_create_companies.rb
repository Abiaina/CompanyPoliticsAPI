class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :lobbying_dollars
      t.integer :contribution_dollars
      t.integer :open_secret_id

      t.timestamps
    end
  end
end
