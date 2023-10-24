# frozen_string_literal: true

class BankTransactionsController < ApplicationController
  before_action :set_bank_transaction, only: %i[show update destroy]

  def index
    @bank_transactions = BankTransaction.all

    render json: @bank_transactions
  end

  def show
    render json: @bank_transaction
  end

  def create
    @bank_transaction = BankTransaction.new(bank_transaction_params)

    if @bank_transaction.save
      render json: @bank_transaction, status: :created, location: @bank_transaction
    else
      render json: @bank_transaction.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @bank_transaction.destroy
  end
  #POST: localhost:3000/bank_transactions/transferir "Rota Criada para fazer isso"
  def transferir 
    transferidor = Account.find(params[:transferidor_id])
    recebidor = Account.find(params[:recebidor_id])
    TransactionService::TransferirService.new(transferidor, recebidor, params[:valor]).transferir
  end
  #POST: localhost:3000/bank_transactions/depositar "Rota Criada para fazer isso"
  def depositar 
    account = Account.find(params[:account_id])
    bank_transaction = BankTransaction.find(params[:bank_transaction_id])
    TransactionService::DepositarService.new(account,bank_transaction).depositar 
  end

  def pagar 
    account = Account.find(params[:id])
    TransactionService::PagarService.new(account, params[:pagamento]).pagar
  end

  private

  def set_bank_transaction
    @bank_transaction = BankBranch.find(params[:id])
  end

  def bank_transaction_params
    params.require(:bank_transaction).permit(:transaction_type, :transaction_value, :account_id)
  end
end
