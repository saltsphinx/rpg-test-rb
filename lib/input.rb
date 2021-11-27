# frozen-string-literal: true

require_relative './cmd'

class Input
  include CMD

  def initalize
    @options = ['table1', 'table2']
  end

  def get_input
    user_input = gets
    user_input = user_input.chomp.strip unless user_input.nil?
    parsed_input = parse_input(user_input)
    command = CMDS[parsed_input.shift]
    parse_params(command, parsed_input)
  end

  def parse_input(input)
    input.split(/\s+/)
  end

  def parse_params(*params)
    params.flatten.reject(&:nil?)
  end
end
