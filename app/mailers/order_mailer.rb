class OrderMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def order_summary_email(order)
    @order = order
    mail(to: @order.email, subject: "Your order summary")
  end  
end
