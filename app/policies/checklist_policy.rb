class ChecklistPolicy < ApplicationPolicy
  def create?
    user.role.checklist_manager
  end

  def update?
    user.role.checklist_manager
  end

  def destroy?
    user.role.checklist_manager
  end
end
