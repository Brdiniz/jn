class Ability
  include CanCan::Ability

  def initialize(user)
    user = User.find_by_login(user)
    alias_action :index, :new, :create, :edit, :update, :show, :to => :manage_jobs
    alias_action :index, :new, :create, :edit, :update, :show, :to => :manage_listings
    alias_action :index, :edit, :update, :show, :to => :my_account
    alias_action :show, :update, :to => :manage_company
    alias_action :password, :to => :my_user

    if user.admin?
      can :manage, :all
    else
      can :read, :category
      
      can :manage_jobs, Job do |j|
        j.company.professionals.include?(user.person) || j.company == user.person
      end

      can :manage_listings, Listing do |l|
        l.job.company.professionals.include?(user.person) || l.job.company == user.person
      end
      
      can :my_account, Account do |a|
        a == user.person
      end
      
      can :manage_company, Company do |c|
        c.professionals.include?(user.person) || c == user.person
      end
      
      can :my_user, User do |u|
        u || (u.login == user.login)
      end
    end
  end
end