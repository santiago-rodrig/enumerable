# frozen_string_literal: true

# This is my own implementation of the Enumerable module methods
module Enumerable
  def my_each
    size.times { |i| yield self[i] }
    self
  end

  def my_each_with_index
    size.times { |i| yield self[i], i }
    self
  end
end
