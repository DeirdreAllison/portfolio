class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    attr_accessor :user, :article

    def initialize(user, article)
      @user = user
      @article = article
    end

    def resolve
        scope
    end

    def publish?
      @user.editor?
    end
  end
end
