# frozen_string_literal: true

class Account < ApplicationRecord
  belongs_to :customer
  belongs_to :bank_branch
  has_many :bank_transactions

  validates :account_type, :current_balance, :customer_id, :bank_branch_id, presence: true
  
  enum account_type: {
    checking_account: 0,
    savings_account: 1
  }
end