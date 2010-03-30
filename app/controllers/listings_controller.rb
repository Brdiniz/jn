class ListingsController < InheritedResources::Base
  belongs_to :account
  belongs_to :job

  def destroy
    destroy! do |format|
      format.html { redirect_to account_job_path(@account, @job) }
    end
  rescue Exception => e
    flash[:error] = e.message
    redirect_to(account_job_listing_path)
  end
end