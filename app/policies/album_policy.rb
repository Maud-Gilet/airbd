class AlbumPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
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
    user_is_owner_or_admin?
  end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    false
    # User can't destroy an album : user can only make it 'unavailable'
  end

  private

  def user_is_owner_or_admin?
    record.user == user || user.admin?
    # - record: the album passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end
end
