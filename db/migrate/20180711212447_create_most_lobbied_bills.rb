class CreateMostLobbiedBills < ActiveRecord::Migration[5.2]
  def change
    create_table :most_lobbied_bills do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
