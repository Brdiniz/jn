class AccountsController < InheritedResources::Base
  def associate_account
    @account = Account.find(params[:account_id])
  end

  def disconnect_account
  end

  def create
    @account = params[:account][:kind].constantize.new(params[:account]) if !params[:account][:kind].blank?
    @account = Account.new(params[:account]) if params[:account][:kind].blank?

    if @account.save
      flash[:notice] = 'Criação de Conta realizada com sucesso!'
      redirect_to(account_path(@account))
    else
      render :action => "new" 
    end
  end
end
