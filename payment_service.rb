class PaymentService
  def initialize(processor)
    @processor = processor
  end

  def make_payment(amount)
    @processor.process(amount)
  end
end
