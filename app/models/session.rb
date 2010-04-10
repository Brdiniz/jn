class Session < ActiveRecord::Base
  belongs_to :account
  
  before_validation :authenticate_account
  
  attr_accessor :login, :password, :match
 
  validates_presence_of :match,
    :message => 'for your name and password could not be found',
    :unless => :session_has_been_associated?
 
  before_save :associate_session_to_account
    
  private
  def authenticate_account
    unless session_has_been_associated?
      self.match = Account.find_by_login_and_password(self.login, self.password)
    end
  end
 
  def associate_session_to_account
    self.account_id ||= self.match.id
  end
 
  def session_has_been_associated?
    self.account_id
  end  
end