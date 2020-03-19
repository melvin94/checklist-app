class ChecklistItemPolicy < ApplicationPolicy
  def create?
    user.role.checklist_manager
  end

  def edit?
    user.role.checklist_manager
  end

  def update?
    user.role.checklist_user
  end

  def destroy?
    user.role.checklist_manager
  end

  def complete?
    user.role.checklist_user
  end
end
