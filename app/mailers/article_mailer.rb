class ArticleMailer < ApplicationMailer
  def article_destroy_info(article)
    @article = article

    mail to: @article.user.email, subject: 'Your article has been deleted'
  end
end
