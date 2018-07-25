class SubsidiaryAddCompanyId < ActiveRecord::Migration[5.2]
  def change
      add_reference :subsidiaries, :company, foriegn_key: true
  end
end
