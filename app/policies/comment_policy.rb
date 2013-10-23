class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, post)
    @user = user
    @comment = comment
  end

  def create?
    true
  end

  def update?
    if user
      user.editor?
    else
      false
    end
  end

  def approve?
    update?
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
      user.editor?  || comment.approved?  || user == comment.author
    else
      comment.approved?
    end
  end

  Scope = Struct.new(:user, :scope) do
    def resolve
      if user
        if user.editor?
          scope.all
        else
          scope.where("author_id = ? OR approved = ?", user.id, true)
        end
      else
        scope.where(:approved => true)
      end
    end
  end

end
