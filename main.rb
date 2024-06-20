require_relative 'stripe_processor'
require_relative 'paypal_processor'
require_relative 'payment_service'

stripe_processor = StripeProcessor.new
paypal_processor = PayPalProcessor.new

service = PaymentService.new(stripe_processor)
puts service.make_payment(100)

service = PaymentService.new(paypal_processor)
puts service.make_payment(200)
