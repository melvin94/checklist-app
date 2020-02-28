class RolePolicy < ApplicationPolicy
  def index?
    user.role.support
  end

  def show?
    user.role.support
  end

  def create?
    user.role.support
  end

  def update?
    user.role.support
  end

  def destroy?
    user.role.support
  end
end
