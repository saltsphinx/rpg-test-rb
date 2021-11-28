# frozen-string-literal: true

require_relative './player'
require_relative './room'
require_relative './userinput'
require_relative './response'

class Game
  include UserInput
  include Response

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
    @room = Room.new('Starter room')
  end
end
