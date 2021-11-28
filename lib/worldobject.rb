# frozen-string-literal: true

class WorldObject
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class Container < WorldObject
  attr_reader :storage
  
  def initialize(storage, name)
    super(name)
    @storage =  storage
  end
end