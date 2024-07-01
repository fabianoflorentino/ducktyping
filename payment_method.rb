class PaymentMethod
  def initialize(processor)
    @processor = processor
  end

  def process_method(amount)
    @processor.process(amount)
  end
end
