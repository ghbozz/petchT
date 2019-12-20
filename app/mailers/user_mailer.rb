class UserMailer < ApplicationMailer

  def article_submitted
    @article = params[:article]
    @admin = params[:admin]
    mail(to: @admin.email, subject: 'Nouveau conseil')
  end

end
