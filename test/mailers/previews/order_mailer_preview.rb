class OrderMailerPreview < ActionMailer::Preview
  def order_confirmation
    OrderMailer.with(order: Order.first).welcome_email
  end
end