class UserPolicy < ApplicationPolicy
  def index?
  end

  def show?
  end

  def new?
    current_user
  end

  def create?
  end

  def edit?
  end

  def update?
  end

  def destroy?
  end
end
