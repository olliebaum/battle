class Player
  DEFAULT_HP = 60

  attr_reader :name, :hp, :missing_go

  def initialize(name, hp = DEFAULT_HP)
    @name = name
    @hp = hp
    @missing_go = [false]
  end

  def deduct(amount)
    @hp -= amount
    @hp = 0 if @hp < 0
  end

  def add(amount)
    @hp += amount
  end

  def dead?
    hp == 0
  end

  def miss_go(bool)
    @missing_go << bool
  end
end
