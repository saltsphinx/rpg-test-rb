# frozen-string-literal: true

require_relative './player'
require_relative './room'
require_relative './userinput'
require_relative './response'
require_relative './settings'

class Game
  include UserInput
  include Response
  include Settings

  def initialize
    @player = nil
    @room = nil
  end

  def play
    new_game
    loop do
      input = get_input
      manage_input input
      break puts 'game end' if input.nil?
    end
  end

  def new_game
    @player = Player.new
    apple = Item.new('apple', 'A bright red apple with a brown stem and a pretty green leaf atop.')
    spoon = Container.new([], 'spoon', 'A silver spoon.')
    bowl = Container.new([apple, spoon], 'bowl', 'A wide brimmed, wooden bowl.')
    cup = Container.new([], 'cup', 'A small wooden cup.')
    table = ContainerObject.new([bowl, cup], 'table', 'A large, old, oval wooden table, made of dark oak.')
    @room = Room.new([table], 'Starter room')
  end

  def floor
    @room.floor if @room
  end
end
