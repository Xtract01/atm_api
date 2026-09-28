module Api
  module V1
    class WithdrawController < BaseController
      before_action :set_transaction_amount, :balance_is_enough
      def create
        @bank_account.balance -= transaction_amount
        @bank_account.save
        render json: {
            message: "Withdrawal successful"
        }
      end
    private
      def balance_is_enough
        if @bank_account.balance < transaction_amount
            return render json: {
                error: "Insufficient balance"
            }
        end
      end
    end
  end
end