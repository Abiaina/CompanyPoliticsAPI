class CreateTopRecipients < ActiveRecord::Migration[5.2]
  def change
    create_table :top_recipients do |t|
      t.string :name

      t.timestamps
    end
  end
end
