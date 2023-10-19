class BankTransaction < ApplicationRecord
  belongs_to :account

  enum transaction_type: {
    transferencia: 0,
    deposito: 1,
    pagamento: 2,
    transferencia_recebida: 3
  }
end
