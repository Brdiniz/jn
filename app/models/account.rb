class Account < ActiveRecord::Base
  has_many :jobs, :dependent => :destroy
   
   attr_accessor :login_associate
   attr_accessor :email_main_associate

  def <=>(other)
    self.name <=> other.name
  end
end
