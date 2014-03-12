class Player
  def initialize()
      @health=20
      @rescued=0;
  end

  def play_turn(warrior)
    @health=warrior.health if @health==nil
    if warrior.feel.enemy?
      warrior.attack!
    elsif warrior.feel.captive?
      warrior.rescue!
    else
      if wasHurt?(warrior.health)
        warrior.walk! :backward
      elsif warrior.feel(:backward).captive?
            warrior.rescue! :backward
            @rescued=1
      elsif warrior.health<15
        warrior.rest!
      else
        warrior.walk!
      end
    end
    @health=warrior.health
  end
  def wasHurt?(health)
    if @rescued==0
        return health != @health
    else
        return health < @health
    end
  end
end
