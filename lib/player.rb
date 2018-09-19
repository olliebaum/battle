class Player
  attr_reader :name, :hp

  def initialize(name)
    @name = name
    @hp   = 60
  end

  def deduct(amount)
    @hp -= amount
  end

  private
  attr_writer :hp
end
