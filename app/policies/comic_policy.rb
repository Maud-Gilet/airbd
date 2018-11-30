class ComicPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # Define what the user will see according to his 'status'
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    true
  end

  def update?
    true
  end

  private

  def user_is_owner_or_admin?
    record.user == user || user.admin?
    # - record: the album passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end
end
