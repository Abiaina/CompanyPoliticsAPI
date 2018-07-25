class CreateShareHolders < ActiveRecord::Migration[5.2]
  def change
    create_table :share_holders do |t|
      t.string :name

      t.timestamps
    end
  end
end
