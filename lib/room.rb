# frozen-string-literal: true

class Room
  attr_reader :floor

  def initialize(description, floor = [])
    @floor = floor
    @description = description
  end
end
