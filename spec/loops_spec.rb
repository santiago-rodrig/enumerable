# frozen_string_literal: true

require_relative './../enumerable.rb'

describe Enumerable do
  let(:array) { [1, 2, 3, 'bob', 'mohamed', :santiago, false] }
  let(:hash) { { name: 'susan', job: 'cooker', age: 35, 1 => [1, 2, false] } }
  let(:range) { (1..78) }

  context 'with more than 1 argument and no block' do
    describe '#my_each' do
      context 'hash' do
        it 'should raise ArgumentError' do
          expect { hash.my_each(1, 2, false) }.to raise_error(ArgumentError)
        end
      end
      context 'array' do
        it 'should raise ArgumentError' do
          expect { array.my_each(1, 2, false) }.to raise_error(ArgumentError)
        end
      end
      context 'range' do
        it 'dhould raise ArgumentError' do
          expect { range.my_each(1, 2, false) }.to raise_error(ArgumentError)
        end
      end
    end
    describe '#my_each_with_index' do
      context 'array' do
        it 'should raise ArgumentError' do
          expect { array.my_each_with_index(1, 2, false) }.to raise_error(ArgumentError)
        end
      end
      context 'hash' do
        it 'should raise ArgumentError' do
          expect { hash.my_each_with_index(1, 2, false) }.to raise_error(ArgumentError)
        end
      end
      context 'range' do
        it 'should raise ArgumentError' do
          expect { range.my_each_with_index(1, 2, false) }.to raise_error(ArgumentError)
        end
      end
    end
  end

  context 'without block and no arguments' do
    describe '#my_each' do
      context 'array' do
        it 'should return an Enumerator' do
          expect(array.my_each.is_a?(Enumerator)).to be_truthy
        end
      end

      context 'hash' do
        it 'should return an Enumerator' do
          expect(hash.my_each.is_a?(Enumerator)).to be_truthy
        end
      end

      context 'range' do
        it 'should return an Enumerator' do
          expect(range.my_each.is_a?(Enumerator)).to be_truthy
        end
      end
    end
    describe '#my_each_with_index' do
      context 'array' do
        it 'should return an Enumerator' do
          expect(array.my_each_with_index.is_a?(Enumerator)).to be_truthy
        end
      end

      context 'hash' do
        it 'should return an Enumerator' do
          expect(hash.my_each_with_index.is_a?(Enumerator)).to be_truthy
        end
      end

      context 'range' do
        it 'should return an Enumerator' do
          expect(range.my_each_with_index.is_a?(Enumerator)).to be_truthy
        end
      end
    end
  end

  context 'with a block with no variables' do
      describe '#my_each' do
        context 'array' do
          it 'should iterate over each element' do
            counter = 0
            array.my_each { counter += 1 }
            expect(counter).to eq(array.size)
          end
        end

        context 'hash' do
          it 'should iterate over each key-value pair' do
            counter = 0
            hash.my_each { counter += 1 }
            expect(counter).to eq(hash.size)
          end
        end

        context 'range' do
          it 'should iterate over each integer' do
            counter = 0
            range.my_each { counter += 1 }
            expect(counter).to eq(range.size)
          end
        end
      end

      describe '#my_each_with_index' do
        context 'array' do
          it 'should iterate over each element' do
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

    context 'with a block with 1 variable' do
      describe '#my_all' do
        context 'array' do
        end

        context 'hash' do
        end

        context 'range' do
        end
      end
      context 'arrays and ranges' do
        describe '#my_each' do
          it 'should iterate yielding values' do
            temp_array = []
            array.my_each { |element| temp_array << element }
            expect(temp_array).to eq(array)
            temp_array.clear
            range.my_each { |element| temp_array << element }
            expect(temp_array).to eq(range.to_a)
          end
        end
        describe '#my_each_with_index' do
          it 'should iterate yielding values' do
            temp_array = []
            array.my_each_with_index { |element| temp_array << element }
            expect(temp_array).to eq(array)
            temp_array.clear
            range.my_each_with_index { |element| temp_array << element }
            expect(temp_array).to eq(range.to_a)
          end
        end
      end
      context 'hashes' do
        describe '#my_each' do
          it 'should iterate yielding key-value pairs as arrays' do
            keys = []
            values = []
            hash.my_each do |pair|
              keys << pair[0]
              values << pair[1]
            end
            expect(keys).to eql(hash.keys)
            expect(values).to eql(hash.values)
          end
        end
        describe '#my_each_with_index' do
          it 'should iterate yielding key-value pairs as arrays ' do
            keys = []
            values = []
            hash.my_each do |pair|
              keys << pair[0]
              values << pair[1]
            end
            expect(keys).to eql(hash.keys)
            expect(values).to eql(hash.values)
          end
        end
      end
    end

    context 'with 2 variables' do
      context 'arrays and ranges' do
        describe '#my_each' do
          it 'should iterate as with 1 variable' do
            temp_array = []
            array.my_each { |element, _other| temp_array << element }
            expect(temp_array).to eq(array)
            temp_array.clear
            range.my_each { |element, _other| temp_array << element }
            expect(temp_array).to eq(range.to_a)
          end
        end
        describe '#my_each_with_index' do
          it 'should iterate yielding values and indices' do
            temp_array = []
            array.my_each_with_index do |_element, index|
              temp_array << array[index]
            end
            expect(temp_array).to eq(array)
            temp_array.clear
            range_as_array = range.to_a
            range.my_each_with_index do |_element, index|
              temp_array << range_as_array[index]
            end
            expect(temp_array).to eq(range_as_array)
          end
        end
      end
      context 'hashes' do
        describe '#my_each' do
          it 'should iterate yielding key and value' do
            keys = []
            values = []
            hash.my_each do |key, value|
              keys << key
              values << value
            end
            expect(keys).to eq(hash.keys)
            expect(values).to eq(hash.values)
          end
        end
        describe '#my_each_with_index' do
          it 'should iterate yielding key-value pairs and the index of the pair in the hash as an array' do
            keys = []
            values = []
            indices = []
            hash.my_each_with_index do |pair, index|
              keys << pair[0]
              values << pair[1]
              indices << index
            end
            hash_as_array = hash.to_a
            temp_array = []
            indices.each { |index| temp_array[index] = hash_as_array[index] }
            expect(keys).to eq(hash.keys)
            expect(values).to eq(hash.values)
            expect(temp_array).to eq(hash_as_array)
          end
        end
      end
    end

    context 'with more than 2 variables' do
      context 'arrays and ranges' do
        describe '#my_each' do
          it 'should iterate as with 1 variable' do
            temp_array = []
            array.my_each { |element, _other, _test_variable, _second_variable| temp_array << element }
            expect(temp_array).to eq(array)
            temp_array.clear
            range.my_each { |element, _other, _test_variable, _second_variable| temp_array << element }
            expect(temp_array).to eq(range.to_a)
          end
        end
        describe 'my_each_with_index' do
          it 'should iterate as with 1 variable' do
            temp_array = []
            array.my_each_with_index do |_element, index, _another_variable|
              temp_array << array[index]
            end
            expect(temp_array).to eq(array)
            temp_array.clear
            range_as_array = range.to_a
            range.my_each_with_index do |_element, index, _another_variable|
              temp_array << range_as_array[index]
            end
            expect(temp_array).to eq(range_as_array)
          end
        end
      end
      context 'hashes' do
        describe '#my_each' do
          it 'should iterate as with 2 variables' do
            keys = []
            values = []
            hash.my_each do |key, value, _another_variable|
              keys << key
              values << value
            end
            expect(keys).to eq(hash.keys)
            expect(values).to eq(hash.values)
          end
        end
        describe '#my_each_with_index' do
          it 'should iterate as with 2 variables' do
            keys = []
            values = []
            indices = []
            hash.my_each_with_index do |pair, index, _another_variable|
              keys << pair[0]
              values << pair[1]
              indices << index
            end
            hash_as_array = hash.to_a
            temp_array = []
            indices.each { |index| temp_array[index] = hash_as_array[index] }
            expect(keys).to eq(hash.keys)
            expect(values).to eq(hash.values)
            expect(temp_array).to eq(hash_as_array)
          end
        end
      end
    end
  end
end
