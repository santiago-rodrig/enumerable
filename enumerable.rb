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

  def all_match?(regex)
    my_each { |v| return false unless v =~ regex }
    true
  end

  def both_of_class(_val1, _val2, class_name)
    val_1.is_a?(class_name) && val_2.is_a?(class_name)
  end

  def all_from_class?(class_name)
    if is_a? Hash
      my_each { |k, v| return false unless both_of_class(k, v, class_name) }
    else
      my_each { |v| return false unless v.is_a? class_name }
    end
    true
  end

  def all_the_same?(object)
    my_each { |v| return false unless v == object }
    true
  end

  def my_all?(arg = nil)
    as_array = to_a
    return true if as_array.empty?

    if arg.is_a? Class
      return false unless all_from_class? arg

      return true
    end

    if arg.is_a? Regexp
      return false unless is_a?(Array) && all_match(arg)

      return true
    end

    if arg
      return false unless all_the_same?(arg)

      return true
    end

    if block_given?
      my_each { |k, v| return false unless yield k, v } if is_a? Hash
      my_each { |v| return false unless yield v } unless is_a? Hash
      return true
    else
      # TODO: what if arg is nil or false? (inputed by the user)
      is_a?(Array) ? my_each { |v| return false unless v } : true
    end

    true
  end

  def my_any?
    as_array = to_a
    return false if as_array.empty?

    my_each { |k, v| return true if yield k, v } if is_a? Hash
    my_each { |v| return true if yield v } unless is_a? Hash
    false
  end

  def my_none?
    as_array = to_a
    return true if as_array.empty?

    (return false unless my_any? { |k, v| yield k, v  }) if is_a? Hash
    (return false unless my_any? { |v| yield v  }) unless is_a? Hash
    true
  end
end
