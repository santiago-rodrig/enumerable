# frozen_string_literal: true

require_relative '../enumerable'

describe '#my_each_with_index' do
  let(:array) { [1, 2, 3, :bob, :sam, :beth, 'dancing', 'on the floor', (1...92_323), ['a', :b, /c/]] }
  let(:hash) { { name: 'yes', diablo_four: 'blood', 'thanos' => 'exists' } }
  let(:range) { (1..875) }
  let(:test_array) { [] }

  context 'with arguments' do
    context 'array' do
      it 'should raise ArgumentError' do
        expect { array.my_each_with_index(1, '2', 'yes') }.to raise_error(ArgumentError)
      end
    end

    context 'hash' do
      it 'should raise ArgumentError' do
        expect { hash.my_each_with_index(1, '2', 'yes') }.to raise_error(ArgumentError)
      end
    end

    context 'range' do
      it 'should raise ArgumentError' do
        expect { range.my_each_with_index(1, '2', 'yes') }.to raise_error(ArgumentError)
      end
    end
  end

  context 'without block' do
    context 'array' do
      it 'should return an Enumerator' do
        expect(array.my_each_with_index).to be_instance_of(Enumerator)
      end
    end

    context 'hash' do
      it 'should return an Enumerator' do
        expect(hash.my_each_with_index).to be_instance_of(Enumerator)
      end
    end

    context 'range' do
      it 'should return an Enumerator' do
        expect(range.my_each_with_index).to be_instance_of(Enumerator)
      end
    end
  end

  # rubocop:disable Lint/UselessAssignment
  context 'with a block of 0 variables' do
    context 'array' do
      it 'should iterate over each value' do
        counter = 0
        array.my_each_with_index { counter += 1 }
        expect(counter).to eq(array.size)
      end
    end

    context 'hash' do
      it 'should iterate over each key-value pair' do
        counter = 0
        hash.my_each_with_index { counter += 1 }
        expect(counter).to eq(hash.size)
      end
    end

    context 'range' do
      it 'should iterate over each integer' do
        counter = 0
        range.my_each_with_index { counter += 1 }
        expect(counter).to eq(range.size)
      end
    end
  end
  # rubocop:enable Lint/UselessAssignment

  context 'with a block of 1 variable' do
    context 'array' do
      it 'should iterate yielding each value' do
        array.my_each_with_index { |value| test_array << value }
        expect(test_array).to eq(array)
      end
    end

    context 'hash' do
      it 'should iterate yielding each key-value pair' do
        hash.my_each_with_index { |pair| test_array << pair }
        expect(test_array).to eq(hash.to_a)
      end
    end

    context 'range' do
      it 'should iterate yielding each integer' do
        range.my_each_with_index { |integer| test_array << integer }
        expect(test_array).to eq(range.to_a)
      end
    end
  end

  context 'with a block of 2 variables' do
    context 'hash' do
      it 'should iterate yielding key-value pair and index' do
        hash.my_each_with_index { |pair, index| test_array[index] = pair }
        expect(test_array).to eq(hash.to_a)
      end
    end
  end
end
