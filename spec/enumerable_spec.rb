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
          expect { array.my_each_with_index(1, 2, false) }.to raise_error(ArgumentError)
          expect { array.my_each_with_index(1, 2, false) }.to raise_error(ArgumentError)
        end
      end
    end

    context 'without block' do
      describe '#my_each' do
        it 'should return an enumerable' do
        end
      end
      describe '#my_each_with_index' do
        it 'should return an enumerable' do
        end
      end
    end

    context 'with a block' do
      context 'with no variables' do
        describe '#my_each' do
          it 'should iterate without yielding anything' do
          end
        end
        describe '#my_each_with_index' do
          it 'should iterate without yielding anything' do
          end
        end
      end
      context 'with 1 variable' do
        context 'arrays and ranges' do
          describe '#my_each' do
            it 'should iterate yielding values' do
            end
          end
          describe '#my_each_with_index' do
            it 'should iterate yielding values' do
            end
          end
        end
        context 'hashes' do
          describe '#my_each' do
            it 'should iterate yielding key-value pairs as arrays' do
            end
          end
          describe '#my_each_with_index' do
            it 'should iterate yielding key-value pairs as arrays and the index of the hash as an array' do
            end
          end
        end
      end
      context 'with 2 variables' do
        context 'arrays and ranges' do
          describe '#my_each' do
            it 'should iterate as with 1 variable' do
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
