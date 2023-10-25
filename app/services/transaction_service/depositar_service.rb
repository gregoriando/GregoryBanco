module TransactionService
  class DepositarService
    def initialize(account, valor_deposito)
      @account = account
      @valor_deposito = valor_deposito
    end

    def depositar
      deposito!
    end

    private

    def deposito!
      @account.current_balance += @valor_deposito
      @account.save
      create_transaction(@account, 'deposito', @valor_deposito)
    end

    def create_transaction(account, transaction_type, valor_deposito)
      BankTransaction.create(
        account: account,
        transaction_type: transaction_type,
        transaction_value: valor_deposito
      )
    end
  end
end
