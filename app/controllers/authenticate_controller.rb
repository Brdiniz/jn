class AuthenticateController < InheritedResources::Base

  before_filter :maintain_session_and_user

  def current_session
    session[:id]
  end
  
  private
  def maintain_session_and_user
    @session = Session.find_by_id(current_session)
    logout unless @session
  end
  
  def logout
    Session.find(current_session).destroy if current_session
    session[:id] = nil
    redirect_to(new_session_path)
  end
end