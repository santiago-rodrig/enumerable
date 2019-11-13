# frozen_string_literal: true

# this is my own implementation of the Enumerable module methods

# rubocop:disable Metrics/ModuleLength, Metrics/BlockNesting, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
module Enumerable
  # helper methods

  def all_match?(regex)
    to_a.my_each { |v| return false unless v =~ regex }
    true
  end

  def all_from_class?(class_name)
    to_a.my_each { |v| return false unless v.is_a? class_name }
    true
  end

  def all_the_same?(object)
    to_a.my_each { |v| return false unless v == object }
    true
  end

  def any_from_class?(class_name)
    to_a.my_each { |v| return true if v.is_a? class_name }
    false
  end

  def any_the_same?(object)
    to_a.my_each { |v| return true if v == object }
    false
  end

  def any_match?(regex)
    to_a.my_each { |v| return true if v.instance_of?(String) && v.match(regex) }
    false
  end

  def none_match?(regex)
    to_a.my_each { |v| return false if v =~ regex } if is_a? Array
    true
  end

  def none_of_class?(class_name)
    to_a.my_each { |v| return false if v.is_a? class_name }
    true
  end

  def none_the_same?(object)
    to_a.my_each { |v| return false if v == object }
    true
  end

  # enumerable methods

  def my_each(&block)
    return to_enum :my_each unless block_given?

    as_array = to_a
    if is_a? Hash
      case block.parameters.size
      when 1
        size.times { |i| yield as_array[i] }
      else
        size.times { |i| yield as_array[i][0], as_array[i][1] }
      end
    end
    size.times { |i| yield as_array[i] } unless is_a? Hash
    self
  end

  def my_each_with_index
    return to_enum :my_each_with_index unless block_given?

    as_array = to_a
    size.times { |i| yield as_array[i], i }
    self
  end

  def my_select(&block)
    return to_enum :my_select unless block_given?

    if is_a?(Hash)
      selection = {}
      case block.parameters.size
      when 0
        my_each { |k, v| selection[k] = v if yield }
      when 1
        my_each { |k, v| selection[k] = v if yield(k) }
      else
        my_each { |k, v| selection[k] = v if yield(k, v) }
      end
    else
      selection = []
      my_each { |v| selection << v if yield } if block.parameters.size.zero?
      my_each { |v| selection << v if yield(v) } if block.parameters.size.positive?
    end
    selection
  end

  def my_all?(*args, &block)
    return true if to_a.empty?

    raise ArgumentError, 'only 1 argument allowed' if args.size > 1

    unless args.empty?
      arg = args[0]
      return all_from_class?(arg) if arg.is_a? Class
      return all_match?(arg) if arg.is_a? Regexp

      return all_the_same? arg
    end

    if block_given?
      case block.parameters.size
      when 0
        size.times { return false unless yield }
      when 1
        to_a.my_each { |v| return false unless yield(v) }
      else
        to_a.my_each { |v| return false unless yield(v) } unless is_a? Hash
        my_each { |k, v| return false unless yield(k, v) } if is_a? Hash
      end
    else
      to_a.my_each { |v| return false unless v }
    end
    true
  end

  def my_any?(*args, &block)
    return false if to_a.empty?

    raise ArgumentError, 'only 1 argument allowed' if args.size > 1

    unless args.empty?
      arg = args[0]
      return any_from_class?(arg) if arg.is_a? Class
      return any_match?(arg) if arg.is_a? Regexp

      return any_the_same? arg
    end

    if block_given?
      case block.parameters.size
      when 0
        size.times { return true if yield }
      when 1
        to_a.my_each { |v| return true if yield(v) }
      else
        to_a.my_each { |v| return true if yield(v) } unless is_a? Hash
        my_each { |k, v| return true if yield(k, v) } if is_a? Hash
      end
    else
      to_a.my_each { |v| return true if v }
    end
    false
  end

  def my_none?(*args, &block)
    return true if to_a.empty?

    raise ArgumentError, 'only 1 argument allowed' if args.size > 1

    unless args.empty?
      arg = args[0]
      return none_of_class?(arg) if arg.is_a? Class
      return none_match?(arg) if arg.is_a? Regexp

      return none_the_same? arg
    end

    if block_given?
      case block.parameters.size
      when 0
        size.times { return false if yield }
      when 1
        to_a.my_each { |v| return false if yield(v) }
      else
        to_a.my_each { |v| return false if yield(v) } unless is_a? Hash
        my_each { |k, v| return false if yield(k, v) } if is_a? Hash
      end
    else
      to_a.my_each { |v| return false if v }
    end
    true
  end

  def my_count(*args, &block)
    return size if args.empty? && !block_given?

    raise(ArgumentError, 'expected 1 argument') if args.size > 1

    counter = 0

    unless block_given?
      my_each { |v| counter += 1 if v == args[0] }
      return counter
    end

    case block.parameters.size
    when 0
      my_each { counter += 1 if yield }
    when 1
      my_each { |v| counter += 1 if yield(v) }
    else
      my_each { |v| counter += 1 if yield(v) } unless is_a?(Hash)
      my_each { |k, v| counter += 1 if yield(k, v) } if is_a?(Hash)
    end

    counter
  end

  def my_map(&block)
    return to_enum :my_map unless block_given?

    mapped = []
    case block.parameters.size
    when 1
      to_a.my_each { |v| mapped << block.call(v) }
    when 2
      my_each { |k, v| mapped << block.call(k, v) } if is_a? Hash
    end
    mapped
  end

  def my_inject(*args, &block)
    case args.size
    when 0
      raise(LocalJumpError, 'no block given') unless block_given?

      case block.parameters.size
      when 0
        size.times do |i|
          yield unless i == size - 1
          return yield if i == size - 1
        end
      when 1
        result = to_a.first
        to_a[1..].my_each do
          result = yield(result)
        end

        return result
      else
        result = to_a.first
        to_a[1..].my_each do |object|
          result = yield(result, object)
        end

        return result
      end
    when 1
      unless block_given?
        unless args[0].instance_of?(Symbol) || args[0].instance_of?(String)
          raise(TypeError, 'not a symbol or string')
        end

        result = to_a.first
        to_a[1..].my_each do |object|
          result = result.send(args[0], object)
        end

        return result
      end

      case block.parameters.size
      when 0
        size.times do |i|
          yield unless i == size - 1
          return yield if i == size - 1
        end
      when 1
        result = args[0]
        my_each { result = yield(result) }

        return result
      else
        result = args[0]
        my_each { |object| result = yield(result, object) }

        return result
      end
    when 2
      unless args[1].instance_of(Symbol) || args[1].instance_of(String)
        raise(TypeError), 'second argument is not a symbol or string')
      end

      result = args[0]
      my_each { |object| result = result.send(args[1], object) }
    else
      raise ArgumentError, 'expected at most 2 arguments'
    end
  end
end
# rubocop:enable Metrics/ModuleLength, Metrics/BlockNesting, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
