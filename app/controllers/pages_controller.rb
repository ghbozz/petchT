class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @articles = Article.published.order(created_at: :desc).last(25)
    @top_articles = Article.top.last(4)

    if params[:newsletter]
      @status = subscribe_to_newsletter(params[:newsletter][:email])

      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  private

  def subscribe_to_newsletter(email)
    begin
      @gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
      @audience_id = ENV['MAILCHIMP_AUDIENCE_ID']

      @gibbon.lists(@audience_id).members.create(
        body: {
          email_address: email,
          status: "subscribed",
        }
      )
      status = "Vous êtes maintenant abonné"
    rescue Gibbon::MailChimpError => e
      puts "Houston, we have a problem: #{e.raw_body}"
      if e.title == "Member Exists"
        status = 'Vous êtes déjà abonné'
      elsif e.title == "Invalid Resource"
        status = "l'adresse email n'est pas valide"
      else
        status = "Oops, il y a eu une erreur"
      end
    end
    return status
  end

end
