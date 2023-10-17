# frozen_string_literal: true

class Account < ApplicationRecord
  belongs_to :customer
  belongs_to :bank_branch
  has_many :bank_transactions

  validates :account_type, :current_balance, :customer_id, :bank_branch_id, presence: true
  
  def depositar(transaction_value)
    self.current_balance += transaction_value
    save
  end

  def transferir(transaction_value, customer_id)
    if self.current_balance >= transaction_value
      self.current_balance -= transaction_value
      Customer.depositar(transaction_value)
      save
      Customer.save
    else
      self.current_balance < transaction_value
    end
  end

  def pagar(transaction_value)
    if self.current_balance >= transaction_value
      self.current_balance -= transaction_value
      save
    else
      self.current_balance < transaction_value
    end
  end

  enum account_type: {
    checking_account: 0,
    savings_account: 1
  }
  
end