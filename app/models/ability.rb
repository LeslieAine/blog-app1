class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, user

    can :manage, Post, author: user
    can :manage, Comment, author: user

    return unless user.admin?

    can :manage, :all
  end
end
