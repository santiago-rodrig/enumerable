# frozen_string_literal: true

require_relative '../enumerable'

describe '#my_inject' do
  let(:array_numbers) { [1, 3, 4, 5, 234, -234, 23] }
  let(:array) { [1, 2, [3, 4], '5', :six, :seven]}
  let(:range) { 1..100 }
  let(:hash) { { name: 'sam', position: 'general', medals: 967 } }

  context 'with one argument and no block' do
    context 'argument is not a symbol' do
      context 'an array' do
        it 'raises TypeError' do
          expect { array.my_inject(2) }.to raise_error(TypeError)
        end
      end

      context 'a hash' do
        it 'raises TypeError' do
          expect { hash.my_inject([1, 2]) }.to raise_error(TypeError)
        end
      end

      context 'a range' do
        it 'raises TypeError' do
          expect { range.my_inject(-23) }.to raise_error(TypeError)
        end
      end
    end

    context 'argument is a symbol' do
      context 'all elements share a combination method' do
        subject { collection.my_inject(:+) }

        context 'an array' do
          let(:collection) { array_numbers }

          it('returns the sum of the numbers') { should eq(36) }
        end

        context 'a hash' do
          let(:collection) { hash }

          it('returns the sum of the key-value pairs') { should eq(hash.to_a.flatten) }
        end

        context 'a range' do
          let(:collection) { range }

          it('returns the sum of the sequence') { should eq(5050) }
        end
      end

      context 'not all elements share a combination method' do
        context 'an array' do
          it('raises TypeError') { expect { array.my_inject(:+) }.to raise_error(TypeError) }
        end
      end

      context 'the method is not available for the first element' do
        context 'an array' do
          it('raises NoMethodError') { expect { array.my_inject(:upcase) }.to raise_error(NoMethodError) }
        end

        context 'a hash' do
          it('raises NoMethodError') { expect { hash.my_inject(:swapcase) }.to raise_error(NoMethodError) }
        end

        context 'a range' do
          it('raises NoMethodError') { expect { range.my_inject(:pop) }.to raise_error(NoMethodError) }
        end
      end
    end
  end

  context 'with two arguments and no block' do
    context 'all elements share a combination method' do
      context 'an array' do
        subject { array_numbers.my_inject(7, :+) }

        it 'starts with the first argument' do
          should eq(array_numbers.my_inject(:+) + 7)
        end

        it 'returns the combination of all elements' do
          should eq(36)
        end
      end

      context 'a hash' do
        subject { hash.my_inject([:power, 'convincement'], :+) }

        it 'starts with the first argument' do
          should eq([:power, 'convincement'] + hash.my_inject(:+))
        end

        it 'returns the combination of all elements' do
          should eq([:power, 'convincement'] + hash.to_a.flatten)
        end
      end

      context 'a range' do
        subject { range.my_inject(9, :+) }

        it 'starts with the first argument' do
          should eq(9 + range.my_inject(:+))
        end

        it 'returns the combination of all elements' do
          should eq(5059)
        end
      end
    end

    context 'not all elements share a combination method' do
      context 'an array' do
        it 'raises TypeError' do
          expect { array.my_inject(0, :+) }.to raise_error(TypeError)
        end
      end
    end

    context 'the argument does not have the method' do
      context 'an array' do
        it 'raises NoMethodError' do
          expect { array.my_inject('a', :+) }.to raise_error(NoMethodError)
        end
      end

      context 'a hash' do
        it 'raises NoMethodError' do
          expect { hash.my_inject('a', :+) }.to raise_error(NoMethodError)
        end
      end

      context 'a range' do
        it 'raises NoMethodError' do
          expect { range.my_inject('a', :+) }.to raise_error(NoMethodError)
        end
      end
    end
  end

  # TODO
  context 'with one argument and a block of 0 variables' do
    subject { collection.my_inject('whatever') { 'banzai' } }

    context 'an array' do
      let(:collection) { array }

      it 'returns the block returned value' do
        should eq('banzai')
      end
    end

    context 'a hash' do
      let(:collection) { hash }

      it 'returns the block returned value' do
        should eq('banzai')
      end
    end

    context 'a range' do
      let(:collection) { range }

      it 'returns the block returned value' do
        should eq('banzai')
      end
    end
  end

  context 'with one argument and a block of 1 variable' do
  end

  context 'with one argument and a block of 2 variables' do
  end

  context 'with one argument and a block of 3 variables' do
  end

  context 'with no arguments and a block of 0 variables' do
  end

  context 'with no arguments and a block of 1 variable' do
  end

  context 'with no arguments and a block of 2 variables' do
  end

  context 'with no arguments and a block of 3 variables' do
  end
end
