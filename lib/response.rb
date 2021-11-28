# frozen-string-literal: true
require_relative 'actions'
require_relative 'cmd'

module Response
  include Actions
  include CMD

  def manage_input(inputs)
    if inputs.is_a? Array
      command = CMDS[inputs.first]
      self.send(command, inputs[1..-1]) if command && Game.method_defined?(command)
    end
  end

  def inspect(params)
    puts 'Inspect'
  end

  def grab(params)
    p params
    if params.length > 0
      params, quantity = check_quantity params
      p params
      puts quantity
    end
  end

  private

  def check_quantity(params)
    if params.first.match /\d+/
      return params, param.shift.to_i
    else
      return params, 1
    end
  end
end
