# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
     user ||= User.new # guest user (not logged in)

    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :create, Course if user.role == 'instructor'
      can :create, Category if user.role == 'admin'
      can :create, Evaluation if user.role == 'student'
      can :create, CourseDetail if user.role == 'instructor'
      can :create, Planning if user.role == 'instructor'
      # Ajoutez d'autres règles selon vos besoins, instructor-student-director-parent
    end
  end
end
