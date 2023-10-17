class BankTransaction < ApplicationRecord
  belongs_to :account

  enun transaction_type: {
    transferencia: 0,
    deposito: 1,
    pagamento: 2
  }
end
