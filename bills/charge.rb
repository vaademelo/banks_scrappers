class Charge
  attr_accessor :date,
                :description,
                :amount

  def initialize(args)
    @date = args[:date]
    @description = args[:description]
    @amount = args[:amount]
  end
end
