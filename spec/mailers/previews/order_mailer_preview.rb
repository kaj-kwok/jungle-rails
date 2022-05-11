# Preview all emails at http://localhost:3000/rails/mailers/order
class OrderMailerPreview < ActionMailer::Preview
  def order_confirmation
    OrderMailer.with(order: Order.last).order_confirmation
  end
end