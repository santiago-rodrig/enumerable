# frozen_string_literal: true

require_relative '../enumerable'

describe '#my_count' do
  context 'with one argument' do
    context 'all elements are the same' do
      context 'an array' do
      end

      context 'a range' do
      end

      context 'a hash' do
      end
    end

    context 'some elements are the same' do
      context 'an array' do
      end

      context 'a range' do
      end

      context 'a hash' do
      end
    end

    context 'none of the elements are the same' do
      context 'an array' do
      end

      context 'a range' do
      end

      context 'a hash' do
      end
    end
  end

  context 'with a block of 0 variables' do
    context 'that always evaluates to true' do
      context 'an array' do
      end

      context 'a range' do
      end

      context 'a hash' do
      end
    end

    context 'that not always evaluates to true' do
      context 'an array' do
      end

      context 'a range' do
      end

      context 'a hash' do
      end
    end

    context 'that always evaluates to false' do
      context 'an array' do
      end

      context 'a range' do
      end

      context 'a hash' do
      end
    end
  end

  context 'with a block of 1 variable' do
    context 'that always evaluates to true using the variable' do
      context 'an array' do
      end

      context 'a range' do
      end

      context 'a hash' do
      end
    end

    context 'that not always evaluates to true using the variable' do
      context 'an array' do
      end

      context 'a range' do
      end

      context 'a hash' do
      end
    end

    context 'that never evaluates to true' do
      context 'an array' do
      end

      context 'a range' do
      end

      context 'a hash' do
      end
    end
  end

  context 'with a block of 2 variables' do
    context 'that always evaluates to true using both variables' do
      context 'a hash' do
      end
    end

    context 'that not always evaluates to true using both variables' do
      context 'a hash' do
      end
    end

    context 'that never evaluates to true using both variables' do
      context 'a hash' do
      end
    end
  end
end
