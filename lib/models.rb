
class ItemBase
  attr_reader :name, :weight

  def initialize(name, description = '', weight = 0)
    @name = name
    @description = description
    @weight = weight
  end

  def raw_description
    @description
  end

  def description
    puts %w[a e i o u].include?(name[0]) ? "An #{name}," : "A #{name},"
    puts "#{@description}"
  end
end

module Storage
  attr_accessor :storage

  def description
    super
    puts "On it: #{@storage.map(&:name).join(', ')}" unless @storage.empty?
  end
end
