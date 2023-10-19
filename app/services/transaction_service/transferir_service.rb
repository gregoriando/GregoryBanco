# frozen_string_literal: true
module TransactionService
  class TransferirService
    def initialize(transferidor, recebidor, valortransferido)
   		@transferidor = transferidor
    	@recebidor = recebidor
    	@valortransferido = valortransferido
    end

    def transferir
      ActiveRecord::Base.transaction do
        transferencia!
        transferencia_recebida!
      end
    end

    private

    def transferencia!
      if @transferidor.current_balance >= @valortransferido
          @transferidor.current_balance -= @valortransferido
          @transferidor.save
          create_transaction(@transferidor, 'transferencia', @valortransferido)
      else
        raise "Saldo Insuficiente"
      end
    end
    
    def transferencia_recebida! 
        @recebidor.current_balance += @valortransferido
        @recebidor.save
        create_transaction(@recebidor, 'transferencia_recebida', @valortransferido)
    end
      

    def create_transaction(account, transaction_type, valortransferido)
      BankTransaction.create(
        account: account,
        transaction_type: transaction_type,
        transaction_value: valortransferido
      )
    end
  end
end