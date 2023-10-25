module TransactionService
  class PagarService
    def initialize(account, pagamento)
      @account = account
      @pagamento = pagamento
    end

    def pagar
      pagando!
    end

    private

    def pagando!
      raise 'Saldo insuficiente para realizar o pagamento' unless @account.current_balance >= @pagamento

      @account.current_balance -= @pagamento
      @account.save
      create_transaction(@account, 'pagamento', @pagamento)
    end

    def create_transaction(account, transaction_type, pagamento)
      BankTransaction.create(
        account: account,
        transaction_type: transaction_type,
        transaction_value: pagamento
      )
    end
  end
end
