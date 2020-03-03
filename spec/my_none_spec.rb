# frozen_string_literal: true

describe '#my_none?' do
  let(:array) { [1, 2, 3, :bob, :sam, :beth, 'dancing', 'on the floor', (1...92_323), ['a', :b, /c/]] }
  let(:array_nil) { ['stuart', :sarah, nil, { distro: 'debian' }] }
  let(:array_falses) { Array.new(876, false) }
  let(:array_words) { %w[dog chicken cat cow person monkey lion zebra jiraffe elephant] }
  let(:hash) { { name: 'yes', diablo_four: 'blood', 'thanos' => 'exists' } }
  let(:hash_one_pair) { { destiny: 'greatness' } }
  let(:range) { (1..875) }
  let(:range_one_integer) { (1...2) }
  let(:test_array) { [] }

  context 'empty collection' do
    context 'array' do
      it 'returns true' do
        expect([].my_none?).to be_truthy
      end
    end

    context 'hash' do
      it 'returns true' do
        expect({}.my_none?).to be_truthy
      end
    end

    context 'range' do
      it 'returns true' do
        expect((0..-1).my_none?).to be_truthy
      end
    end
  end

  # rubocop:disable Metrics/BlockLength
  context 'with 1 argument' do
    context 'the argument is a regular expression' do
      context 'none of the elements match' do
        context 'array' do
          it 'should return true' do
            expect(array_words.my_none?(/\d/)).to be_truthy
          end
        end

        context 'hash' do
          it 'should return true' do
            expect(hash.my_none?(/./)).to be_truthy
          end
        end

        context 'range' do
          it 'should return true' do
            expect(range.my_none?(/./)).to be_truthy
          end
        end
      end

      context 'at least 1 element matches' do
        context 'array' do
          it 'should return false' do
            expect(array_words.my_none?(/k/)).to be_falsy
          end
        end
      end
    end

    context 'the argument is a class' do
      context 'none of the elements pertain to the class' do
        context 'array' do
          it 'should return true' do
            expect(array.my_none?(Proc)).to be_truthy
          end
        end

        context 'hash' do
          it 'should return true' do
            expect(hash.my_none?(String)).to be_truthy
          end
        end

        context 'range' do
          it 'should return true' do
            expect(range.my_none?(Hash)).to be_truthy
          end
        end
      end

      context 'at least one element pertains to the same class' do
        context 'array' do
          it 'should return false' do
            expect(array.my_none?(Symbol)).to be_falsy
          end
        end

        context 'hash' do
          it 'should return false' do
            expect(hash.my_none?(Array)).to be_falsy
          end
        end

        context 'range' do
          it 'should return false' do
            expect(range.my_none?(Integer)).to be_falsy
          end
        end
      end
    end

    context 'the argument is an instance' do
      context 'none of the elements is equal' do
        context 'array' do
          it 'should return true' do
            expect(array_falses.my_none?(true)).to be_truthy
          end
        end

        context 'hash' do
          it 'should return true' do
            expect(hash_one_pair.my_none?([:name, 'bobert'])).to be_truthy
          end
        end

        context 'range' do
          it 'should return true' do
            expect(range_one_integer.my_none?(0)).to be_truthy
          end
        end
      end

      context 'at least 1 element is equal' do
        context 'array' do
          it 'should return false' do
            expect(array.my_none?(2)).to be_falsy
          end
        end

        context 'hash' do
          it 'should return false' do
            expect(hash.my_none?(%w[thanos exists])).to be_falsy
          end
        end

        context 'range' do
          it 'should return false' do
            expect(range.my_none?(56)).to be_falsy
          end
        end
      end
    end
  end
  # rubocop:enable Metrics/BlockLength

  context 'with more than 1 argument' do
    context 'array' do
      it 'should raise ArgumentError' do
        expect { array.my_none?(1, 2, '3') }.to raise_error(ArgumentError)
      end
    end

    context 'hash' do
      it 'should raise ArgumentError' do
        expect { hash.my_none?(1, 2, '3') }.to raise_error(ArgumentError)
      end
    end

    context 'range' do
      it 'should raise ArgumentError' do
        expect { range.my_none?(1, 2, '3') }.to raise_error(ArgumentError)
      end
    end
  end

  context 'without a block' do
    context 'none of elements evaluate to true' do
      context 'array' do
        it 'should return true' do
          expect(array_falses.my_none?).to be_truthy
        end
      end
    end

    context 'at least 1 element evaluates to true' do
      context 'array' do
        it 'returns false' do
          expect(array_nil.my_none?).to be_falsy
        end
      end
    end
  end

  # rubocop:disable Metrics/BlockLength
  context 'with a block of 0 variables' do
    context 'the block always evaluates to false' do
      context 'array' do
        it 'should return true' do
          expect(array.my_none? { false }).to be_truthy
        end
      end

      context 'hash' do
        it 'should return true' do
          expect(hash.my_none? { false }).to be_truthy
        end
      end

      context 'range' do
        it 'should return true' do
          expect(range.my_none? { false }).to be_truthy
        end
      end
    end

    context 'the block not always evaluates to false' do
      def get_bool(collection)
        condition = false
        counter = 0
        collection.my_none? do
          counter += 1
          condition = true if counter.eql?(3)
        end
      end

      context 'array' do
        it 'should return false' do
          expect(get_bool(array)).to be_falsy
        end
      end

      context 'hash' do
        it 'should return false' do
          expect(get_bool(hash)).to be_falsy
        end
      end

      context 'range' do
        it 'should return false' do
          expect(get_bool(range)).to be_falsy
        end
      end
    end
  end

  context 'with a block of 1 variable' do
    context 'array' do
      it 'should yield the values' do
        array.my_none? { |value| test_array << value && false }
        expect(test_array).to eq(array)
      end
    end

    context 'hash' do
      it 'should yield the pairs' do
        hash.my_none? { |pair| test_array << pair && false }
        expect(test_array).to eq(hash.to_a)
      end
    end

    context 'range' do
      it 'should yield the integers' do
        range.my_none? { |integer| test_array << integer && false }
        expect(test_array).to eq(range.to_a)
      end
    end

    context 'the block always evaluates to false' do
      context 'array' do
        # rubocop:disable Style/SymbolProc
        it 'should return true' do
          expect(array.my_none? { |value| value.nil? }).to be_truthy
        end
        # rubocop:enable Style/SymbolProc
      end

      context 'hash' do
        it 'should return true' do
          expect(hash.my_none? { |pair| pair.instance_of?(Proc) }).to be_truthy
        end
      end

      context 'range' do
        it 'should return true' do
          expect(range.my_none? { |integer| integer.eql?(3.1415926539) }).to be_truthy
        end
      end
    end

    context 'the block not always evaluates to false' do
      context 'array' do
        it 'should return false' do
          expect(array.my_none? { |value| value == 3 }).to be_falsy
        end
      end

      context 'hash' do
        it 'should return false' do
          expect(hash.my_none? { |pair| pair.include?('thanos') }).to be_falsy
        end
      end

      context 'range' do
        it 'should return false' do
          expect(range.my_none? { |integer| integer.eql?(98) }).to be_falsy
        end
      end
    end
  end
  # rubocop:enable Metrics/BlockLength

  context 'with a block of 2 variables' do
    context 'hash' do
      it 'should yield key and value' do
        hash.my_none? { |key, value| test_array.push(key, value) && false }
        expect(test_array).to eq(hash.to_a.flatten)
      end
    end

    context 'the block always evaluates to false' do
      context 'hash' do
        it 'returns true' do
          expect(hash.my_none? { |key, value| key.instance_of?(Proc) && value.is_a?(Method) }).to be_truthy
        end
      end
    end

    context 'the block not always evaluates to false' do
      context 'hash' do
        it 'returns false' do
          expect(hash.my_none? { |key, value| key.eql?('thanos') && value == 'exists' }).to be_falsy
        end
      end
    end
  end
end
