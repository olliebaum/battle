class Game
  attr_reader :players, :message, :current_attacker

  def initialize(p1, p2)
    @players = [p1, p2]
    @message = ""
    @current_attacker = 0
  end

  def attack(attacker, multiplier) # attacker is 0 or 1
    missed_go(@current_attacker, multiplier != 1)
    attack_amount = ((multiplier ** 2) * rand(3..13)).to_i
    players[attacker - 1].deduct(attack_amount)
    switch_turns
    update_message_attack(attack_amount, multiplier != 1)
  end

  def rest(attacker, multiplier) # attacker is 0 or 1
    missed_go(@current_attacker, multiplier != 1)
    heal_amount = ((multiplier ** 1.5) * rand(3..13)).to_i
    players[attacker].add(heal_amount)
    switch_turns
    update_message_heal(heal_amount, multiplier != 1)
  end

  def update_message_attack(attack_amount, miss = false)
    message = "#{players[@current_attacker - 1].name} attacked "\
      "#{players[@current_attacker].name} for #{attack_amount} damage!"
    message += (miss ? " #{players[@current_attacker - 1].name} misses their next turn." : "")
    @message = message + "\n#{players[@current_attacker].name}'s go now."
  end

  def update_message_heal(heal_amount, miss = false)
    message = "#{players[@current_attacker - 1].name} healed #{heal_amount} damage!"
    message += (miss ? " #{players[@current_attacker - 1].name} misses their next turn." : "")
    @message = message + "\n#{players[@current_attacker].name}'s go now."
  end

  def game_over?
    players.reduce(false) { |output, player| output || player.dead? }
  end

  def switch_turns
    @current_attacker = (@current_attacker == 0) ? 1 : 0
  end

  def missed_go(index, bool)
    players[index].miss_go(bool)
  end

end
