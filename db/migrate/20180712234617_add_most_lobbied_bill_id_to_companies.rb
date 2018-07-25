class AddMostLobbiedBillIdToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_reference :companies, :most_lobbied_bill, foriegn_key: true
  end
end
