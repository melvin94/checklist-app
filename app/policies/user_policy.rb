class UserPolicy < ApplicationPolicy
  def index?
    user.role.admin
  end

  def show?
    if record.role.super_admin
      user.role.super_admin
    else
      user.role.admin || user.role_id == record.role_id
    end
  end

  def create?
    user.role.admin
  end

  def update?
    if record.role.super_admin
      user.role.super_admin
    else
      user.role.admin || user.role_id == record.role_id
    end
  end

  def destroy?
    user.role.super_admin
  end
end
