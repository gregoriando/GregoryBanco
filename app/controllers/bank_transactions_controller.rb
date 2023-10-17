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
    @bank_transaction = BankBranch.new(bank_transaction_params)

    if @bank_transaction.save
      render json: @bank_transaction, status: :created, location: @bank_transaction
    else
      render json: @bank_transaction.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @bank_transaction.destroy
  end

  private

  def set_bank_transaction
    @bank_transaction = BankBranch.find(params[:id])
  end

  def bank_transaction_params
    params.require(:bank_transaction).permit(:transaction_type, :transaction_value, :account_id)
  end
end
