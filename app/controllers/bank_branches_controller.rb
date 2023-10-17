# frozen_string_literal: true

class BankBranchesController < ApplicationController
  before_action :set_bank_branch, only: %i[show update destroy]

  def index
    @bank_branches = BankBranch.all

    render json: @bank_branches
  end

  def show
    render json: @bank_branch
  end

  def create
    @bank_branch = BankBranch.new(bank_branch_params)

    if @bank_branch.save
      render json: @bank_branch, status: :created, location: @bank_branch
    else
      render json: @bank_branch.errors, status: :unprocessable_entity
    end
  end

  def update
    if @bank_branch.update(bank_branch_params)
      render json: @bank_branch
    else
      render json: @bank_branch.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @bank_branch.destroy
  end

  private

  def set_bank_branch
    @bank_branch = BankBranch.find(bank_branch_params)
  end

  def bank_branch_params
    params.require(:bank_branch).permit(:branch_name, :branch_type, :legal_responsible, :open_date)
  end
end

