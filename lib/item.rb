# frozen-string-literal: true
require_relative './models'

class Item < ItemBase
  def initialize(name, description = nil)
    super(name, description)
  end
end

class Container < Item
  include Storage

  def initialize(storage = [], name = nil, description = nil)
    super(name, description)
    @storage =  storage
  end
end
