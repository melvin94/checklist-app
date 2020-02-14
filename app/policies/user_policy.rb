class UserPolicy < ApplicationPolicy
  def index?
  end

  def show?
  end

  def create?
    Role.find(user.role_id).user_manager
  end

  def update?
    Role.find(user.role_id).user_manager || user.role_id == record.role_id
  end

  def destroy?
    Role.find(user.role_id).user_manager
  end
end
