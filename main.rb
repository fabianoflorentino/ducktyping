require_relative 'stripe_processor'
require_relative 'paypal_processor'
require_relative 'credit_processor'
require_relative 'payment_service'

class Main
  stripe_processor = StripeProcessor.new
  paypal_processor = PayPalProcessor.new
  credit_processor = CreditProcessor.new

  service = PaymentService.new(stripe_processor)
  puts service.make_payment(100)

  service = PaymentService.new(paypal_processor)
  puts service.make_payment(200)

  credit = PaymentService.new(credit_processor)
  puts credit.make_payment(300)
end

Main.new
