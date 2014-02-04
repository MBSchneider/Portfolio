# Authorization policy for post actions based on user role
class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def create?
    if user
      user.editor? || user.author?
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
    if user
      user.editor?  || post.published?  || user == post.author
    else
      post.published?
    end
  end

  def resolve
    scope
  end
end
