require_relative 'stripe_processor'
require_relative 'paypal_processor'
require_relative 'credit_processor'
require_relative 'payment_method'

class Main
  stripe_processor = StripeProcessor.new
  paypal_processor = PayPalProcessor.new
  credit_processor = CreditProcessor.new

  service = PaymentMethod.new(stripe_processor)
  puts service.process_method(100)

  service = PaymentMethod.new(paypal_processor)
  puts service.process_method(200)

  credit = PaymentMethod.new(credit_processor)
  puts credit.process_method(300)
end

Main.new
