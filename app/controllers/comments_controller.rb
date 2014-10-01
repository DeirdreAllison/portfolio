class CommentsController < ApplicationController
  before_action :set_article

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = @article.comments.build(comments_params)
    if @comment.save
      flash[:notice] = 'Post submitted for approval'
      redirect_to articles_path
    else
      flash[:notice] = 'Comment not saved'
      redirect_to articles_path
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:author, :content,
                                    (:approved if current_user.present? &&
                                    (current_user.editor? || current_user.author?)))
  end

  def set_article
    @article = Article.find(params[:article_id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.require(:article).permit(:title, :body,
                                    (:published if current_user.role == 'editor'))
  end
end
