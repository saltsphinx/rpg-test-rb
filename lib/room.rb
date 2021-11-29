# frozen-string-literal: true

class Room
  attr_reader :floor

  def initialize(floor = [], name = '', description = nil)
    @floor = floor
    @name = name
    @description = description || name
  end

  def description
    puts @description
    puts "Nearby: #{floor.map(&:name).join(', ')}"
  end
end
