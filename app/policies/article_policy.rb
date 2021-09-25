class ArticlePolicy < ApplicationPolicy
  def edit?
    pp user.admin? or current_user_article?
    pp user.admin?
    pp current_user_article?

    user.admin? or current_user_article?
  end

  def update?
    user.admin? or current_user_article?
  end

  def destroy?
    user.admin? or current_user_article?
  end

  def current_user_article?
    record.user_id == user.id
  end
end
