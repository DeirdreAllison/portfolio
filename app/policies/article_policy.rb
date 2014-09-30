class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    attr_accessor :user, :scope

    def resolve
      if @user.author?
        scope.where(author_id: @user.id)
      elsif @user.editor?
        scope.all
      else
        scope.where(published: true)
      end
    end
  end

  def new?
    @user.editor? || @user.author?
  end

  def create?
    @user.author? || @user.editor
  end

  def publish?
    @user.editor?
  end

  def update?
    @user.editor? || @user.author?
  end

  def destroy?
    @user.editor?
  end

  def permitted_attributes
    if publish?
      [:title, :body, :published]
    else
      [:title, :body]
    end
  end
end
