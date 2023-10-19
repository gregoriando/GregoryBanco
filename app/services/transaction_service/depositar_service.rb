module TransactionService 
  class DepositarService 
    def initialize(account, bank_transaction)
      @account = account
      @bank_transaction = bank_transaction
    end

    def call
      depositar
    end

    private
      def depositar
        @account.current_balance += @bank_transaction.transaction_value
        @account.save 
      end
  end
end