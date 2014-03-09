class Player
  def play_turn(warrior)
    if warrior.feel.enemy?
          warrior.attack!
    else
      if warrior.health > 2
        warrior.walk!
      else
        warrior.rest!
      end
    end
    # add your code here
  end
end
