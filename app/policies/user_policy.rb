class UserPolicy < ApplicationPolicy
  def index?
    user.role.admin
  end

  def show?
    user.role.admin || user.role_id == record.role_id
  end

  def create?
    user.role.admin
  end

  def update?
    user.role.admin || user.role_id == record.role_id
  end

  def destroy?
    user.role.admin
  end
end
