# frozen-string-literal: true
require_relative './models'

class WorldObject < ItemBase
  def initialize(name, description = nil)
    super(name, description)
  end
end

class ContainerObject < WorldObject
  include Storage
  
  def initialize(storage = [], name = nil, description = nil)
    super(name, description)
    @storage =  storage
  end
end