class UserPolicy < ApplicationPolicy
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

  class Scope < Scope
    def resolve
      scope.joins(:access_level).where("access_levels.level >= ?", user.access_level.level)
    end
  end
end
