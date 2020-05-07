class RolePolicy < ApplicationPolicy
  def index?
    user.role.super_admin
  end

  def show?
    user.role.super_admin
  end

  def create?
    user.role.super_admin
  end

  def update?
    user.role.super_admin
  end

  def destroy?
    user.role.super_admin
  end
end
