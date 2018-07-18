class NubankBill
  attr_accessor :period
  attr_accessor :amount
  attr_accessor :charges

  def initialize(args)
    @period = args[:period]
    @amount = args[:amount]
    @charges = args[:charges]
  end
end
