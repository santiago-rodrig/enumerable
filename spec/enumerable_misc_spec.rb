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

  context 'With arguments' do
    context 'one argument ' do
      describe '#my_count' do
        context 'array' do
          it 'return number of matches for the argument ' do
            expect(array.my_count(2)).to eq(2)
            expect(array.my_count(5)).to eq(1)
          end

          it 'return zero when there is no matches ' do
            expect(array.my_count(99)).to eq(0)
          end
        end
        context 'range' do
          it 'return number of matches for the argument ' do
            expect(range.my_count(2)).to eq(1)
          end

          it 'return zero when there is no matches ' do
            expect(range.my_count(99)).to eq(0)
          end
        end
      end

      describe '#my_map' do
        context 'Array' do
          it 'in pass an argument raise an error ' do
            expect { array.my_map(2) { |ele| p ele } }.to raise_error(ArgumentError)
          end
        end

        context 'Range' do
          it 'in pass an argument raise an error ' do
            expect { (0..-1).my_map(2) { |ele| p ele } }.to raise_error(ArgumentError)
          end
        end
      end

      describe '#my_inject' do
        context 'symbol argument' do
          it ' initial value with symbol return value of applying binary operation spesified by symbol ' do
            expect(array.my_inject(:+)).to eq(17)
          end
        end

        context 'block and argument with inital value ' do
          it ' initial value with symbol return value of applying binary operation spesified by block ' do
            expect(array.my_inject(10) { |sum, element| sum + element }).to eq(27)
          end
        end
      end

      describe '#my_select' do
        it 'in pass an argument raise an error ' do
          expect { array.my_select(2) { |ele| p ele > 2 } }.to raise_error(ArgumentError)
        end
      end
    end

    context 'two argument' do
      describe '#my_inject' do
        context 'Array' do
          context 'symbol argument with inital value ' do
            it ' initial value with symbol return value of applying binary operation spesified by symbol ' do
              expect(array.my_inject(10, :+)).to eq(27)
            end
          end
        end
        context 'Range' do
          # TODO, m.naser
          context 'symbol argument with inital value ' do
            it ' initial value with symbol return value of applying binary operation spesified by symbol ' do
              expect(array.my_inject(10, :+)).to eq(27)
            end
          end
        end
      end
    end
  end

  context 'without argument' do
    describe '#my_count' do
      context 'Array ' do
        it 'return zero in empty array ' do
          expect([].my_count).to eq(0)
        end
        it 'not empty array return number of elments ' do
          expect(array.my_count).to eq(6)
        end
      end
      context 'Range ' do
        it 'return zero in empty Range ' do
          expect((0..-1).my_count).to eq(0)
        end
      end
    end

    describe '#my_map' do
      context 'array' do
        context 'empty array ' do
          it 'return empty array ' do
            expect([].my_map { |element| element + 2 }).to eq([])
          end
        end
        context 'not empty array ' do
          it 'Returns a new array with the results of running block once for every element in enum.' do
            expect(array.my_map { |element| element + 2 }).to eq([3, 4, 5, 6, 7, 4])
          end
        end
      end

      it 'in pass an argument raise an error ' do
        expect { array.my_map(2) { |ele| p ele } }.to raise_error(ArgumentError)
      end
    end

    describe '#my_inject' do
      it 'send block to function and should return value after applied the operation applied by operation ' do
      end
    end
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
