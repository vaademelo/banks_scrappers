class AccountsController < ApplicationController
  respond_to :html


  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.create(account_params)  
    respond_with @account, location: { action: :index }
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.update_attributes(account_params)  
    respond_with @account, location: { action: :index }
  end

  def show
    @account = Account.find(params[:id])
  end

  def destroy
    Account.find(params[:id]).destroy
  end

  private

    def account_params
      params.require(:account).permit([:name,
                                       :login,
                                       :password,
                                       :account_type])

    end
end
