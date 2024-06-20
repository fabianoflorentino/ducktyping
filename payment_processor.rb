module PaymentProcessor
  def processor(amount)
    raise NotImplementedError, "You must implement the processor method"
  end
end
