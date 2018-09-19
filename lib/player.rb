class Player
  attr_reader :name, :hp

  def initialize(name)
    @name = name
    @hp   = 60  # refactor magic number as a class constant
  end

  def deduct(amount)
    @hp -= amount
  end
end
