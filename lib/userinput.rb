# frozen-string-literal: true

require_relative './cmd'

module UserInput
  def get_input
    user_input = gets
    unless user_input.nil?
      user_input = user_input.chomp.strip
      parse_input(user_input)
    end
  end

  def parse_input(input)
    input.split(/[\s]+/).reject(&:empty?) #.grep_v(/([a-zA-Z][0-9])|([0-9][a-zA-Z])|[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/)
  end
end
