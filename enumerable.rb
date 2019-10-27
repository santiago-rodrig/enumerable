# frozen_string_literal: true

# this is my own implementation of the Enumerable module methods
module Enumerable
  # helper methods

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

  def any_from_class?(class_name)
    my_each { |v| return true if v.is_a? class_name }
    false
  end

  def any_the_same?(object)
    my_each { |v| return true if v == object}
    false
  end

  def any_match?(regex)
    my_each { |v| return true if regex =~ v }
    false
  end

  def no_match?(regex)
    my_each { |v| return false if v =~ regex } if is_a? Array
    true
  end

  def none_from_class?(class_name)
    my_each { |v| return false if v.is_a? class_name } unless is_a? Hash
    true
  end

  def none_the_same?(object)
    my_each { |v| return false if v == object } unless is_a? Hash
    true
  end

  # enumerable methods

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

  def my_all?(*args)
    return true if to_a.empty?
    if args.length > 0
      arg = args[0]
      return all_from_class?(arg) if arg.is_a? Class
      return all_match?(arg) if arg.is_a? Regexp
      return all_the_same? arg
    end

    if block_given?
      my_each { |k, v| return false unless yield k, v } if is_a? Hash
      my_each { |v| return false unless yield v } unless is_a? Hash
    else
      is_a?(Array) ? my_each { |v| return false unless v } : true
    end
    true
  end

  def my_any?(*args)
    return false if to_a.empty?
    if args.length > 0
      arg = args[0]
      return any_from_class?(arg) if arg.is_a? Class
      return any_match?(arg) if arg.is_a? Regexp
      return any_the_same? arg
    end

    if block_given?
      my_each { |k, v| return true if yield k, v } if is_a? Hash
      my_each { |v| return true if yield v } unless is_a? Hash
    else
      return true if is_a? Hash
      my_each { |v| return true if v }
    end
    false
  end

  def my_none?(*args)
    return true if to_a.empty?
    if args.length > 0
      arg = [0]
      return none_from_class?(arg) if arg.is_a? Class
      return none_match?(arg) if arg.is_a? Regexp
      return none_the_same? arg
    end

    if block_given?
      my_each { |k, v| return false if yield k, v } if is_a? Hash
      my_each { |v| return false if yield v } unless is_a? Hash
    else
      return false unless is_a? Array
      my_each { |v| return false if v } if is_a? Array
    end
    true
  end
end
