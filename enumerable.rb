# frozen_string_literal: true

# This is my own implementation of the Enumerable module methods
module Enumerable
  def my_each
    size.times { |i| yield to_a[i][0], to_a[i][1] } if is_a? Hash
    size.times { |i| yield to_a[i] } unless is_a? Hash
    self
  end

  def my_each_with_index
    size.times { |i| yield to_a[i], i }
    self
  end

  def my_select
    if is_a? Hash
      selection = {}
      my_each { |key, value| selection[key] = value if yield key, value }
      return selection
    end
    selection = []
    size.times { |i| selection << to_a[i] if yield to_a[i] }
    selection
  end
end
