class Customer < ApplicationRecord
  has_many :accounts

  validates :name, :email, :cpf, :rg, presence: true
  
end
