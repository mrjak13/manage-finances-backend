class Api::V1::AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all

    # render json: @accounts
    accounts_json = AccountSerializer.new(@accounts).serialized_json
    render json: accounts_json
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create

    @account = current_user.accounts.build(name: account_params[:name])

    if @account.valid? && account_params[:balance].to_f > 0
      transaction = @account.transactions.build(name: "Initial Balance", action: "Deposit", amount: account_params[:balance].to_f, date: DateTime.now)
      @account[:balance] = @account.get_balance
      @account.save

      render json: @account

    elsif @account.save
      render json: @account 
    else
      render json: { 
        errors: @account.errors.full_messages
      }
    end
    
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:name, :balance)
    end
end
