# frozen_string_literal: true

# This is my own implementation of the Enumerable module methods
module Enumerable
  def my_each
    as_array = to_a
    size.times { |i| yield as_array[i][0], as_array[i][1] } if is_a? Hash
    size.times { |i| yield as_array[i] } unless is_a? Hash
    self
  end

  def my_each_with_index
    as_array = to_a
    size.times { |i| yield as_array[i], i }
    self
  end

  def my_select
    if is_a? Hash
      selection = {}
      my_each { |k, v| selection[k] = v if yield k, v }
      return selection
    end
    selection = []
    my_each { |i| selection << i if yield i }
    selection
  end

  def my_all?
    my_each { |k, v| return false unless yield k, v } if is_a? Hash
    my_each { |i| return false unless yield i } unless is_a? Hash
    true
  end
end
