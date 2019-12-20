class UserMailer < ApplicationMailer

  def article_submitted
    @article = params[:article]
    @admin = params[:admin]
    mail(to: @admin.email, subject: "Petch - Nouveau conseil: #{@article.title}")
  end

end
