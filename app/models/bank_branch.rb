class BankBranch < ApplicationRecord
  has_many :accounts

  validates :branch_name, :branch_type, :legal_responsible, :open_date, presence: true

  enum branch_type: {
    premium: 0,
    normal: 1
  }
end
