# frozen_string_literal: true

class AccountsController < ApplicationController
  before_action :set_account, only: %i[show update destroy]

  def index
    @accounts = Account.all

    render json: @accounts
  end

  def show
    render json: @account
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      render json: @account, status: :created, location: @account
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  def update
    if @account.update(account_params)
      render json: @account
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @account.destroy
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end

  def customer_params
    params.require(:account).permit(:account_type, :current_balance, :customer_id, :bank_branch_id)
  end
end