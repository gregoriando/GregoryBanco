module TransactionService
  class PagarService 
    def initialize(account, bank_transaction)
      @account = account 
      @bank_transaction = bank_transaction
    end

	  def pagar
	    if @account.current_balance >= @bank_transaction.transaction_value
				@account.current_balance -= @bank_transaction.transaction_value
				@account.save 
			else 
				raise "Saldo infusiciente para realizar o pagamento"
			end
		end
	end
end





          