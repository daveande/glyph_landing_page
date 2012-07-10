class PagesController < ApplicationController
  def subscribe
     if params[:email].present?
      gibbon = Gibbon.new(ENV['MAILCHIMP_API_KEY'])
      subscribe = gibbon.listSubscribe({:id => "012ba7e68d", :email_address => params[:email], :double_optin => false, :send_welcome => false})
      flash[:notice] = "Thanks for signing up! We'll keep you posted on our updates!"
      redirect_to root_path
     end
  end

end
