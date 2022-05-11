class OrderMailer < ApplicationMailer
  default from: 'confirmations@junglebook.com'

  def order_confirmation
  @order = params[:order]
   mail(to: @order.email, subject: 'Welcome to My Awesome Site')
  end
  
end
