class Player
  @health=20
  def play_turn(warrior)
    @health=warrior.health if @health==nil
    if warrior.feel.enemy?
      warrior.attack!
    elsif warrior.feel.captive?
      warrior.rescue!
    else
      if wasHurt?(warrior.health)
        warrior.walk!
      elsif warrior.health<15
        warrior.rest!
      else
        warrior.walk!
      end
    end
    @health=warrior.health
  end
  def wasHurt?(health)
        return health < @health
  end
end
