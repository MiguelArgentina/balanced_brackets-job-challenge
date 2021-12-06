module TestHelper
  class Node
    attr_accessor :value, :next_node

    def initialize(value, next_node = nil)
      @value = value
      @next_node = next_node
    end
  end

  class Stack
    def initialize
      @stack = Node.new(nil)
    end

    def push(character)
      if @stack.value.nil?
        @stack.value = character
        return
      end
      aux_node = Node.new(character)
      aux_node.next_node = @stack
      @stack = aux_node
    end

    def pop
      poped_value = @stack.value
      if @stack.next_node.nil?
        @stack.value = nil
      else
        @stack = @stack.next_node
      end
      poped_value
    end

  end

  def balanced_brackets?(string)
    string_copy = string.gsub(':)','').gsub(':(','')
    return true if string_copy.nil?
    return true if ['(', ')'].none? { |b| string_copy.include?( b ) }
    opening_brackets = [ '(' ]
    closing_brackets = [ ')' ]
    aux_stack = Stack.new
    string.split('').select do |character|
      aux_stack.push(character) if opening_brackets.include?(character)
      return false if (closing_brackets.include?(character)) && (aux_stack.pop != opening_brackets[closing_brackets.index(character)])
    end
    return false unless aux_stack.pop.nil?
    true
  end
end