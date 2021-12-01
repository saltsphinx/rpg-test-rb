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
  
      return item ? item.raw_description : puts("That item isn't there.")
    end

    puts 'Bad input'
    # If no items in params begin with numbers
    # Check from back of array forward
    # <inspect apple2 bowl3 table>, checks inside table for bowl3, inside bowl for apple2
  end

  def grab(params)
    params, quantity = check_quantity params

    return if verify_params params

    item, container = (params.one? ? get_instance(params.first) : search_container(params))

    @player.manage_inventory(item)
    container.delete item
    @player.inventory
  end

  def verify_params(params)
    params.any? { |i| i.match?(/^\d+/)}
  end

  def search_container(params)
    container = get_instance params.pop
    return if container.nil?
    item = params.shift

    if params.size > 0 # Checks all remaining containers, swapping container variable if object is a container is in within container
      params.reverse_each do |object|
        object_instance = get_instance(object, container)
        return puts "#{object} isn't a container" unless object_instance.class.method_defined?(:storage)
        #container = object_instance if container.storage.map(&:name).include?(object)

        if container.storage.find { |storage_object| storage_object.name == object || object.include?(storage_object.name[0..(storage_object.name.size*CONFIG[:partial_match_percentage])-1]) }
          container = object_instance
        else
         return puts("Container #{object} not in #{container.name}")
        end
      end
    end
    
    return get_instance(item, container)
  end

  def check_quantity(params)
    if params.first.match /^\d+$/
      return params, params.shift.to_i
    else
      return params, 1
    end
  end

  def get_instance(name, container = floor)
    if container.is_a? Array
      object = container.find { |object| object.name == name || name.include?(object.name[0..(object.name.size*CONFIG[:partial_match_percentage])-1]) }
    else
      object = container.storage.find { |object| object.name == name || name.include?(object.name[0..(object.name.size*CONFIG[:partial_match_percentage])-1]) }
    end
    return object, container
  end

  def inspect_room
    @room.description
  end
end
