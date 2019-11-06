# frozen_string_literal: true

require_relative './../enumerable.rb'

describe Enumerable do
  context 'looping methods' do
    # in here we create the subjects to test,
    # that is, the arrays, hashes and ranges,
    # because is only for looping, these data
    # structures should be as simple as possible
    #
    # Create them below

    let(:array) { [1, 2, 3, 'bob', 'mohamed', :santiago, false] }
    let(:hash) { { name: 'susan', job: 'cooker', age: 35, 1 => [1, 2, false] } }
    let(:range) { (1..78) }

    # looping methods shouldn't receive arguments
    # so this can be summarized
    context 'with arguments' do
      describe '#my_each' do
        it 'should raise ArgumentError' do
          expect { array.my_each(1, 2, false) }.to raise_error(ArgumentError)
          expect { hash.my_each(1, 2, false) }.to raise_error(ArgumentError)
          expect { range.my_each(1, 2, false) }.to raise_error(ArgumentError)
        end
      end
      describe '#my_each_with_index' do
        it 'should raise ArgumentError' do
          expect { array.my_each_with_index(1, 2, false) }.to raise_error(ArgumentError)
          expect { hash.my_each_with_index(1, 2, false) }.to raise_error(ArgumentError)
          expect { range.my_each_with_index(1, 2, false) }.to raise_error(ArgumentError)
        end
      end
    end

    context 'without block' do
      describe '#my_each' do
        it 'should return an enumerable' do
          expect(array.my_each.is_a?(Enumerable)).to be_truthy
          expect(hash.my_each.is_a?(Enumerable)).to be_truthy
          expect(range.my_each.is_a?(Enumerable)).to be_truthy
        end
      end
      describe '#my_each_with_index' do
        it 'should return an enumerable' do
          expect(array.my_each_with_index.is_a?(Enumerable)).to be_truthy
          expect(hash.my_each_with_index.is_a?(Enumerable)).to be_truthy
          expect(range.my_each_with_index.is_a?(Enumerable)).to be_truthy
        end
      end
    end

    context 'with a block' do
      context 'with no variables' do
        describe '#my_each' do
          it 'should iterate without yielding anything' do
            counter = 0
            array.my_each { counter += 1 }
            expect(counter).to eq(array.size)

            # reset counter
            counter = 0
            hash.my_each { counter += 1 }
            expect(counter).to eq(hash.size)
            # reset counter
            counter = 0
            range.my_each { counter += 1 }
            expect(counter).to eq(range.size)
          end
        end
        describe '#my_each_with_index' do
          it 'should iterate without yielding anything' do
            counter = 0
            array.my_each_with_index { counter += 1 }
            expect(counter).to eq(array.size)

            # reset counter
            counter = 0
            hash.my_each_with_index { counter += 1 }
            expect(counter).to eq(hash.size)
            # reset counter
            counter = 0
            range.my_each_with_index { counter += 1 }
            expect(counter).to eq(range.size)
          end
        end
      end
      context 'with 1 variable' do
        context 'arrays and ranges' do
          describe '#my_each' do
            it 'should iterate yielding values' do
              temp_array = []
              array.my_each { |element| temp_array << element }
              expect(temp_array).to eq(array)

              # reset the temp array
              temp_array = []
              range.my_each { |element| temp_array << element }
              expect(temp_array).to eq(range.to_a)
            end
          end
          describe '#my_each_with_index' do
            it 'should iterate yielding values' do
              temp_array = []
              array.my_each_with_index { |element| temp_array << element }
              expect(temp_array).to eq(array)

              # reset the temp array
              temp_array = []
              range.my_each_with_index { |element| temp_array << element }
              expect(temp_array).to eq(range.to_a)
            end
          end
        end
        context 'hashes' do
          describe '#my_each' do
            it 'should iterate yielding key-value pairs as arrays' do
              temp_keys_array = temp_values_array = []

              hash.my_each do |row|
                temp_keys_array << row[0]
                temp_values_array << row[1]
              end

              expect(temp_keys_array).to eql(hash.keys)
              expect(temp_values_array).to eql(hash.values)
            end
          end
          describe '#my_each_with_index' do
            it 'should iterate yielding key-value pairs as arrays ' do
              temp_keys_array = temp_values_array = []

              hash.my_each_with_index do |row|
                temp_keys_array << row[0]
                temp_values_array << row[1]
              end

              expect(temp_keys_array).to eql(hash.keys)
              expect(temp_values_array).to eql(hash.values)
            end
          end
        end
      end
      context 'with 2 variables' do
        context 'arrays and ranges' do
          describe '#my_each' do
            it 'should iterate as with 1 variable' do
              temp_keys_array = []

              array.my_each do |key, _value|
                temp_keys_array << key
              end

              expect(temp_keys_array).to eql(array)
              # expect(temp_values_array).to eql(hash.values)
            end
          end
          describe '#my_each_with_index' do
            it 'should iterate as with 1 variable' do
            end
          end
        end
        context 'hashes' do
          describe '#my_each' do
            it 'should iterate yielding key and value' do
            end
          end
          describe '#my_each_with_index' do
            it 'should iterate yielding key and value' do
            end
          end
        end
      end
      context 'with more than 2 variables' do
        context 'arrays and ranges' do
          describe '#my_each' do
            it 'should iterate as with 1 variable' do
            end
          end
          describe 'my_each_with_index' do
            it 'should iterate as with 1 variable' do
            end
          end
        end
        context 'hashes' do
          describe '#my_each' do
            it 'should iterate as with 2 variables' do
            end
          end
          describe '#my_each_with_index' do
            it 'should iterate as with 2 variables' do
            end
          end
        end
      end
    end
  end
end
