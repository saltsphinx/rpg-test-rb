# frozen-string-literal: true

class Player
  def initialize(str = 4, dex = 4, edr = 4, foc = 4)
    @strength, @dexerity, @endurance, @focus = str, dex, edr, foc
    @carry_amount = 90
    @inventory = []
    @equipment = {head: nil, neck: nil, body: nil, back: nil, hands: nil, wrist: nil, ring: nil, legs: nil, boots: nil}
    @status = []
    @space = 15
  end

  def manage_inventory(item)
    if @inventory.size <= @space
      @inventory << item
    end
  end
end

# strength: carry amount, strength actions, melee damage bonus
# dexerity: finess actions, to hit bonus
# endurance: status resistance, hitpoint bonus
# focus: intellegence bonus, to cast bonus
# weight measurement unit: 1 unit:third a pound, called thirds