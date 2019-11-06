# frozen_string_literal: true

require_relative '../enumerable.rb'

# we will build test cases for the following functions
# - my_count
# - my_inject
# - my_map
# - my_select

describe Enumerable do
  let(:array) { [1, 2, 3, 4, 5, 2] }
  let(:hash) { { 'name' => 'mohamed', 'age' => 20 } }
  let(:range) { (1..10) }

  context 'with arguments' do
    describe '#my_count' do
      context 'array' do
        context 'empty array ' do
          it 'return zero in empty array ' do
            expect([].count).to eq(0)
          end
        end
        context 'not empty array ' do
          it 'return number of matches for the argument ' do
            expect(array.my_count(2)).to eq(2)
            expect(array.my_count(5)).to eq(1)
          end
          it 'return zero when there is no matches ' do
            expect(array.my_count(99)).to eq(0)
          end
        end
      end
    end

    describe '#my_map' do
      it 'in pass an argument raise an error ' do
        expect { array.my_map(2) { |ele| p ele } }.to raise_error(ArgumentError)
      end
    end

    describe '#my_inject' do
      # @TODO 
    end

    describe '#my_select' do
      it 'in pass an argument raise an error ' do
        expect { array.my_select(2) { |ele| p ele > 2} }.to raise_error(ArgumentError)
      end
    end
  end

  context 'without a block' do
  end

  context 'with a block' do
    context 'without variables' do
    end
    context 'with 1 variable' do
    end
    context 'with 2 variables' do
    end
    context 'with more than 2 variables' do
    end
  end
end
