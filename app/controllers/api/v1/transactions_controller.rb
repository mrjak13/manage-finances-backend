class Api::V1::TransactionsController < ApplicationController
  before_action :set_transaction, only: [:update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    account = Account.find(params[:account_id].to_i)
    @transactions = account.transactions

    transactions_json = TransactionSerializer.new(@transactions).serialized_json
    render json: transactions_json
  end

  # POST /transactions
  # POST /transactions.json
  def create
    account = Account.find(params[:account_id].to_i)
    @transaction = account.transactions.build(transaction_params)
    if @transaction.save
      account.update(balance: account.get_balance)
      transaction_json = TransactionSerializer.new(@transaction).serialized_json
      render json: transaction_json
    else
      render json: {
        errors: @transaction.errors.full_messages
      }
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    account = @transaction.account
    @transaction.destroy
    account.update(balance: account.get_balance)
    json_user = UserSerializer.new(current_user).serialized_json
    render json: json_user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:name, :date, :amount, :action)
    end
end
