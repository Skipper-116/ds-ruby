# frozen_string_literal: true

require_relative 'stack'

stack = Stack.new

stack.push(1)
stack.push('qowo')
stack.push('👨🏿‍🦰')

puts stack.peek
puts stack.size

puts stack.search('qowo')
puts stack.search('👨🏿‍🦰')
puts stack.search('not there')
(1..1_000_000_000).each do |i|
  stack.push(i)
end

puts stack.empty?

puts stack.pop
puts stack.pop
puts stack.pop

stack.push(1)
stack.clear

puts stack.empty?
puts stack.pop
