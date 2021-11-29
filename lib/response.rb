# frozen-string-literal: true
require_relative 'actions'
require_relative 'cmd'
require_relative 'settings'

module Response
  include Actions
  include CMD
  include Settings

  def manage_input(inputs)
    if inputs.is_a? Array
      command = CMDS[inputs.first]
      self.send(command, inputs[1..-1]) if command && Game.method_defined?(command)
    end
  end

  def inspect(params)
    return inspect_room if params.empty?

    unless params.any? { |i| i.match?(/^\d+/)}
      if params.one?
        item = get_instance(params.first)
      else
        item = search_container(params)
      end
  
      return item ? item.description : puts("That item isn't there.")
    end

    puts 'Bad input'
    # If no items in params begin with numbers
    # Check from back of array forward
    # <inspect apple2 bowl3 table>, checks inside table for bowl3, inside bowl for apple2
  end

  def grab(params)
    params, quantity = check_quantity params
  end

  def search_container(params)
    container = get_instance params.pop
    return if container.nil?
    item = params.shift
    puts 151

    if params.size > 0
      params.reverse_each do |object|
        object_instance = get_instance(object, container)
        return puts "#{object} isn't a container" unless object_instance.class.method_defined?(:storage)
        #container = object_instance if container.storage.map(&:name).include?(object)
        container.storage.map(&:name).include?(object) ? container = object_instance : break
      end
    end
    
    get_instance(item, container) 
  end

  def check_quantity(params)
    if params.first.match /^\d+$/
      return params, params.shift.to_i
    else
      return params, 1
    end
  end

  def get_instance(name, container = floor)
    match_percent = CONFIG[:partial_match_percentage]
    if container.is_a? Array
      container.find { |object| object.name == name || name.include?(object.name[0..(object.name.size*match_percent)-1]) }
    else
      container.storage.find { |object| object.name == name || name.include?(object.name[0..(object.name.size*match_percent)-1]) }
    end
  end

  def inspect_room
    @room.description
  end
end
