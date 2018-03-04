class CommentsController < ApplicationController
    before_action :provide_article, only: [:create, :destroy]

    def create
      @comment = Comment.new(comment_params.merge(article: @article))
      if @comment.save
        redirect_to article_path(@article)
        session[:commenter] = @comment.commenter
      else
        render 'articles/show'
      end
    end

    def destroy
      @comment = @article.comments.find(params[:id])
      @comment.destroy
      redirect_to article_path(@article)
    end

    private

    def provide_article
      @article = Article.find(params[:article_id])
    end

    def comment_params
      params.require(:comment).permit(:commenter, :body, :article_id)
    end
end
