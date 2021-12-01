# frozen-string-literal: true
require_relative './models'

class Item < ItemBase
  def initialize(name, description = nil, weight = 0)
    super(name, description, weight)
  end
end

class Container < Item
  include Storage

  def initialize(storage = [], name = nil, description = nil, weight = 0)
    super(name, description, weight)
    @storage =  storage
  end
end
