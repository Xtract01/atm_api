module Api
  module V1
    class BaseController < ApplicationController
      before_action :find_bank_account
      attr_reader :transaction_amount

    private
      def find_bank_account
        @bank_account = BankAccount.find_by_account_number(params[:account_number])
        if !@bank_account
          render json: {
            error: "We could not find the bank account"
          }
          return
        end
      end
      def set_transaction_amount
        _transaction_amount = params[:amount].to_f
        if _transaction_amount <= 0
                return render json: {
                    error: "Deposit amount must be greater than zero"
                }
        end
        @transaction_amount = _transaction_amount
      end
    end
  end
end