class RentalPolicy < ApplicationPolicy
  def resolve
    scope.all

    ### User could only see rentals is involved in
    # if user.admin?
    #   scope.all
    # else
    #   scope.where(?)
    # end
  end

  def new?
    true
  end

  def create?
    true
  end

  def destroy?
    true
  end
end
