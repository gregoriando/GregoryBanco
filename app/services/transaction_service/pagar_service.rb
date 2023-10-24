module TransactionService
  class PagarService 
    def initialize(account, pagamento)
      @account = account 
      @pagamento = pagamento
    end

	  def pagar
		ActiveRecord::Base.transaction do
      pagando!
		end
	end

  private
		def pagando!
	    if @account.current_balance >= @pagamento
				@account.current_balance-= @pagamento
				@account.save 
        create_transaction(@account, 'deposito', @pagamento)

			else 
				raise "Saldo infusiciente para realizar o pagamento"
			end
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





          