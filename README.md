# Duck Typing

## Classes Concretas

Classes concretas que implementam o método que será usado pela classe que recebe o processador.

- **StripeProcessor**

```ruby
class StripeProcessor
  def process(amount)
    return "Processing payment of #{amount} using Stripe"
  end
end
```

- **PaypalProcessor**

```ruby
class PaypalProcessor
  def process(amount)
    return "Processing payment of #{amount} using Paypal"
  end
end
```

- **CreditCardProcessor**

```ruby
class CreditCardProcessor
  def process(amount)
    return "Processing payment of #{amount} using Credit Card"
  end
end
```

## Serviço

Recebe um processador que obedece à interface PaymentProcessor. Ele chama o método process do processador, independente de qual classe concreta está sendo usada.

```ruby
class PaymentMethod
  def initialize(processor)
    @processor = processor
  end

  def make_payment(amount)
    @processor.process(amount)
  end
end
```

## Uso

Mostra como você pode alternar facilmente entre diferentes implementações do processador de pagamentos.

```ruby
require_relative 'stripe_processor'
require_relative 'paypal_processor'
require_relative 'credit_processor'
require_relative 'payment_service'

stripe_processor = StripeProcessor.new
paypal_processor = PayPalProcessor.new
credit_processor = CreditCardProcessor.new

stripe = PaymentMethod.new(stripe_processor)
puts stripe.make_payment(100)

credit = PaymentMethod.new(credit_processor)
puts credit.make_payment(300)

paypal = PaymentMethod.new(paypal_processor)
puts paypal.make_payment(200)
```

```shell
ruby main.rb

Processing payment of 100 using Stripe
Processing payment of 200 using PayPal
Processing payment of 300 using Credit Card
```
