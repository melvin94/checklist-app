class ChecklistPolicy < ApplicationPolicy
  def show?
    user.access_level.level <= record.access_level.level
  end

  def create?
    user.role.user_manager
  end

  def update?
    user.role.user_manager || user.role_id == record.role_id
  end

  def destroy?
    user.role.user_manager
  end
end
