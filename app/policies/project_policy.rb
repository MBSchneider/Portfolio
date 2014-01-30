class ProjectPolicy < ApplicationPolicy
  attr_reader :user, :project

  def initialize(user, project)
    @user = user
    @project = project
  end

  def create?
    if user
      user.editor? or user.author?
    else
      false
    end
  end

  def new?
    create?
  end

  def update?
    if user
      user.editor?
    else
      false
    end
  end

  def destroy?
    if user
      user.editor?
    else
      false
    end
  end

  def show?
    true
  end

  def resolve
    scope
  end
end
