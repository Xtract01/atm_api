class BankAccount < ApplicationRecord
    validates :account_number, uniqueness:true , presence:true
end
