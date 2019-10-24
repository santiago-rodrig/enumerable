# frozen_string_literal: true

# This is my own implementation of the Enumerable module methods
module Enumerable
  def my_each
    return to_enum :my_each unless block_given?

    as_array = to_a
    size.times { |i| yield as_array[i][0], as_array[i][1] } if is_a? Hash
    size.times { |i| yield as_array[i] } unless is_a? Hash
    self
  end

  def my_each_with_index
    return to_enum :my_each_with_index unless block_given?

    as_array = to_a
    size.times { |i| yield as_array[i], i }
    self
  end

  def my_select
    return to_enum :my_select unless block_given?

    if is_a? Hash
      selection = {}
      my_each { |k, v| selection[k] = v if yield k, v }
      return selection
    end
    selection = []
    my_each { |v| selection << v if yield v }
    selection
  end

  def my_all?
    my_each { |k, v| return false unless yield k, v } if is_a? Hash
    my_each { |v| return false unless yield v } unless is_a? Hash
    true
  end

  def my_any?
    as_array = to_a
    return false if as_array.empty?

    my_each { |k, v| return true if yield k, v } if is_a? Hash
    my_each { |v| return true if yield v } unless is_a? Hash
    false
  end
end
