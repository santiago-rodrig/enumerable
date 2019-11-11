# frozen_string_literal: true

require_relative '../enumerable'

describe '#my_count' do
  let(:array_same) { Array.new(23, 23) }
  let(:array) { [1, 2, 3, 3, 3, 5, nil, nil, false, :job, :jub, 'morty', 'rick'] }
  let(:range) { 1..1_234 }
  let(:range_one) { 1...2 }
  let(:hash) { { who: 'maria', when: 'yesterday', alone: true, married: false, pet: 'bubbles' } }
  let(:hash_one) { { name: 'smithers' } }

  context 'with no arguments nor block' do
    context 'an array' do
      it 'returns its size' do
        expect(array.my_count).to eq(array.size)
      end
    end

    context 'a range' do
      it 'returns its size' do
        expect(range.my_count).to eq(range.size)
      end
    end

    context 'a hash' do
      it 'returns its size' do
        expect(hash.my_count).to eq(hash.size)
      end
    end
  end

  # rubocop:disable Metrics/BlockLength
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
      subject { collection.my_count(element) }

      context 'an array' do
        let(:collection) { array }
        let(:element) { 3 }

        it 'returns the count of coincidences' do
          should eq(3) 
        end
      end

      context 'a range' do
        let(:colection) { range }
        let(:element) { 13 }

        it 'returns the count of coincidences' do
          should eq(1)
        end
      end

      context 'a hash' do
        let(:collection) { hash }
        let(:element) { [:who, 'maria'] }

        it 'returns the count of coincidences' do
          should eq(1)
        end
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
  # rubocop:enable Metrics/BlockLength

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
