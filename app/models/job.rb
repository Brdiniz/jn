class Job < ActiveRecord::Base
  belongs_to :account

  def name
    self.ref_info
  end
end
