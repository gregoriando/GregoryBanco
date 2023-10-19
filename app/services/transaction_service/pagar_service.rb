module TransactionService
	class PagarService 
    def initialize(account, BankTransaction,)
      @account = account 
      @bank_transaction = bank_transaction
    end

    def call 
			pagar
    end

		private 

		def pagar
			if @account.current_balance >= @bank_transaction
					@account.current_balance -= @bank_transaction
					@account.save 
			else 
				raise "Saldo infusiciente para realizar o pagamento"
			end





          