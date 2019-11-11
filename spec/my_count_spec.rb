# frozen_string_literal: true

require_relative '../enumerable'

describe '#my_count' do
  let(:array_same) { Array.new(23, 23) }
  let(:array) { [1, 2, 3, 3, 3, 5, nil, nil, false, :job, :jub, 'morty', 'rick'] }
  let(:range) { 1..1_234 }
  let(:range_one) { 1...2 }
  let(:hash) { { who: 'maria', when: 'yesterday', alone: true, married: false, pet: 'bubles' } }
  let(:hash_one) { { name: 'smithers' } }

  context 'with no arguments nor block' do
    context 'array' do
    end

    context 'range' do
    end

    context 'hash' do
    end
  end

  context 'with one argument' do
    context 'all elements are the same' do
      subject { collection.my_count(element) }

      context 'an array' do
        let(:collection) { array_same }
        let(:element) { 23 }

        it 'returns the size of the collection' do
        end
      end

      context 'a range' do
        let(:collection) { range_one }
        let(:element) { 1 }
      end

      context 'a hash' do
        let(:collection) { hash_one }
        let(:element) { [:name, 'smither'] }
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

    context 'with more of one argument' do
      context 'array' do
      end

      context 'range' do
      end

      context 'hash' do
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
