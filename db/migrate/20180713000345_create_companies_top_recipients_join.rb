class CreateCompaniesTopRecipientsJoin < ActiveRecord::Migration[5.2]
  def change
    create_table :companies_top_recipients do |t|
      t.belongs_to :top_recipient, index: true
      t.belongs_to :company, index: true
    end
  end
end
