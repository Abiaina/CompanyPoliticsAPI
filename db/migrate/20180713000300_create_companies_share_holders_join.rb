class CreateCompaniesShareHoldersJoin < ActiveRecord::Migration[5.2]
  def change
    create_table :companies_share_holders do |t|
      t.belongs_to :company, index: true
      t.belongs_to :share_holder, index: true
    end
  end
end
