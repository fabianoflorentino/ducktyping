# Duck Typing

## Interface

Define a interface com um método process. Ele não faz nada além de levantar um erro se não for implementado.

```ruby
module PaymentProcessor
  def processor(amount)
    raise NotImplementedError, 'You must implement the processor method'
  end
end
```

## Classes Concretas

Implementam a interface PaymentProcessor com sua lógica específica.

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

## Serviço

Recebe um processador que obedece à interface PaymentProcessor. Ele chama o método process do processador, independente de qual classe concreta está sendo usada.

```ruby
class PaymentService
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
require_relative 'payment_service'

stripe_processor = StripeProcessor.new
paypal_processor = PayPalProcessor.new

service = PaymentService.new(stripe_processor)
puts service.make_payment(100)

service = PaymentService.new(paypal_processor)
puts service.make_payment(200)
```