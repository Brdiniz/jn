Given /^I have a new job with title "([^\"]*)" in account with name "([^\"]*)"$/ do |job_name, account_name|
  Factory(:company, :name => account_name) unless Company.find_by_name(account_name)
  Factory(:job, :title => job_name, :company_id => Company.find_by_name(account_name).id)
end
