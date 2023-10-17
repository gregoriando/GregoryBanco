class CreateBankBranches < ActiveRecord::Migration[6.1]
  def change
    create_table :bank_branches do |t|
      t.string :branch_name
      t.integer :branch_type
      t.string :legal_responsible
      t.date :open_date

      t.timestamps
    end
  end
end
