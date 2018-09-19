class Game
  attr_reader :p1, :p2

  def initialize(p1, p2)
    @p1 = p1
    @p2 = p2
  end

  def attack(attacker, victim)
    victim.deduct(10)
  end

  # method for attack confirmation - "John attacks James for 10 damage!"
end
