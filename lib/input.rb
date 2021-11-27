# frozen-string-literal: true

require_relative './cmd'

class Input
  include CMD

  def initalize
    @options = ['table1', 'table2']
  end

  def get_input
    user_input = gets
    user_input = user_input.chomp unless user_input.nil?
    parsed_input = parse_input(user_input)
    command = CMDS[parsed_input.first]
  end

  def parse_input(input)
    input.split(/\s/)
  end
end
