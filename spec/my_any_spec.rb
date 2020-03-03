# frozen_string_literal: true

describe '#my_any?' do
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
      it 'returns false' do
        expect([].my_any?).to be_falsy
      end
    end

    context 'hash' do
      it 'returns false' do
        expect({}.my_any?).to be_falsy
      end
    end

    context 'range' do
      it 'returns false' do
        expect((0..-1).my_any?).to be_falsy
      end
    end
  end

  # rubocop:disable Metrics/BlockLength
  context 'with 1 argument' do
    context 'the argument is a regular expression' do
      context 'at least one element matches' do
        context 'array' do
          it 'should return true' do
            expect(array_words.my_any?(/k/)).to be_truthy
          end
        end
      end

      context 'none of the elements match' do
        context 'array' do
          it 'should return false' do
            expect(array.my_any?(/\d/)).to be_falsy
          end
        end

        context 'hash' do
          it 'should return false' do
            expect(hash.my_any?(/./)).to be_falsy
          end
        end

        context 'range' do
          it 'should return false' do
            expect(range.my_any?(/./)).to be_falsy
          end
        end
      end
    end

    context 'the argument is a class' do
      context 'at least 1 element pertains to the class' do
        context 'array' do
          it 'should return true' do
            expect(array.my_any?(Integer)).to be_truthy
          end
        end

        context 'hash' do
          it 'should return true' do
            expect(hash.my_any?(Array)).to be_truthy
          end
        end

        context 'range' do
          it 'should return true' do
            expect(range.my_any?(Integer)).to be_truthy
          end
        end
      end

      context 'none of the elements pertain to the class' do
        context 'array' do
          it 'should return false' do
            expect(array.my_any?(Method)).to be_falsy
          end
        end

        context 'hash' do
          it 'should return false' do
            expect(hash.my_any?(Float)).to be_falsy
          end
        end

        context 'range' do
          it 'should return false' do
            expect(range.my_any?(String)).to be_falsy
          end
        end
      end
    end

    context 'the argument is an instance' do
      context 'at least 1 element is equal' do
        context 'array' do
          it 'should return true' do
            expect(array_falses.my_any?(false)).to be_truthy
          end
        end

        context 'hash' do
          it 'should return true' do
            expect(hash_one_pair.my_any?([:destiny, 'greatness'])).to be_truthy
          end
        end

        context 'range' do
          it 'should return true' do
            expect(range_one_integer.my_any?(1)).to be_truthy
          end
        end
      end

      context 'none of the elements is equal' do
        context 'array' do
          it 'should return false' do
            expect(array.my_any?(3.1415926539)).to be_falsy
          end
        end

        context 'hash' do
          it 'should return false' do
            expect(hash.my_any?(24)).to be_falsy
          end
        end

        context 'range' do
          it 'should return false' do
            expect(range.my_any?(-1)).to be_falsy
          end
        end
      end
    end
  end
  # rubocop:enable Metrics/BlockLength

  context 'with more than 1 argument' do
    context 'array' do
      it 'should raise ArgumentError' do
        expect { array.my_any?(1, 2, '3') }.to raise_error(ArgumentError)
      end
    end

    context 'hash' do
      it 'should raise ArgumentError' do
        expect { hash.my_any?(1, 2, '3') }.to raise_error(ArgumentError)
      end
    end

    context 'range' do
      it 'should raise ArgumentError' do
        expect { range.my_any?(1, 2, '3') }.to raise_error(ArgumentError)
      end
    end
  end

  context 'without a block' do
    context 'at least 1 element evaluates to true' do
      context 'array' do
        it 'should return true' do
          expect(array.my_any?).to be_truthy
        end
      end

      context 'hash' do
        it 'should return true' do
          expect(hash.my_any?).to be_truthy
        end
      end

      context 'range' do
        it 'should return true' do
          expect(range.my_any?).to be_truthy
        end
      end
    end

    context 'none of the elements evaluates to true' do
      context 'array' do
        it 'returns false' do
          expect(array_falses.my_any?).to be_falsy
        end
      end
    end
  end

  # rubocop:disable Metrics/BlockLength
  context 'with a block of 0 variables' do
    context 'the block always evaluates to false' do
      context 'array' do
        it 'should return false' do
          expect(array.my_any? { false }).to be_falsy
        end
      end

      context 'hash' do
        it 'should return true' do
          expect(hash.my_any? { false }).to be_falsy
        end
      end

      context 'range' do
        it 'should return true' do
          expect(range.my_any? { false }).to be_falsy
        end
      end
    end

    context 'the block not always evaluates to false' do
      def get_bool(collection)
        condition = false
        counter = 0
        collection.my_any? do
          counter += 1
          condition = true if counter.eql?(3)
        end
      end

      context 'array' do
        it 'should return true' do
          expect(get_bool(array)).to be_truthy
        end
      end

      context 'hash' do
        it 'should return true' do
          expect(get_bool(hash)).to be_truthy
        end
      end

      context 'range' do
        it 'should return true' do
          expect(get_bool(range)).to be_truthy
        end
      end
    end
  end

  context 'with a block of 1 variable' do
    context 'array' do
      it 'should yield the values' do
        array.my_any? { |value| test_array << value && false }
        expect(test_array).to eq(array)
      end
    end

    context 'hash' do
      it 'should yield the pairs' do
        hash.my_any? { |pair| test_array << pair && false }
        expect(test_array).to eq(hash.to_a)
      end
    end

    context 'range' do
      it 'should yield the integers' do
        range.my_any? { |integer| test_array << integer && false }
        expect(test_array).to eq(range.to_a)
      end
    end

    context 'the block always evaluates to false' do
      context 'array' do
        # rubocop:disable Style/SymbolProc
        it 'should return false' do
          expect(array.my_any? { |value| value.nil? }).to be_falsy
        end
        # rubocop:enable Style/SymbolProc
      end

      context 'hash' do
        it 'should return false' do
          expect(hash.my_any? { |pair| pair.instance_of?(Float) }).to be_falsy
        end
      end

      context 'range' do
        it 'should return false' do
          expect(range.my_any? { |integer| integer.eql?(3.1415926539) }).to be_falsy
        end
      end
    end

    context 'the block not always evaluates to false' do
      context 'array' do
        it 'should return true' do
          expect(array.my_any? { |value| value == 3 }).to be_truthy
        end
      end

      context 'hash' do
        it 'should return true' do
          expect(hash.my_any? { |pair| pair.include?('thanos') }).to be_truthy
        end
      end

      context 'range' do
        it 'should return true' do
          expect(range.my_any? { |integer| integer.eql?(98) }).to be_truthy
        end
      end
    end
  end
  # rubocop:enable Metrics/BlockLength

  context 'with a block of 2 variables' do
    context 'hash' do
      it 'should yield key and value' do
        hash.my_any? { |key, value| test_array.push(key, value) && false }
        expect(test_array).to eq(hash.to_a.flatten)
      end
    end

    context 'the block always evaluates to false' do
      context 'hash' do
        it 'should return false' do
          expect(hash.my_any? { |key, value| key.instance_of?(Proc) && value.is_a?(NilClass) }).to be_falsy
        end
      end
    end

    context 'the block not always evaluates to false' do
      context 'hash' do
        it 'should return true' do
          expect(hash.my_any? { |key, value| key.eql?('thanos') && value == 'exists' }).to be_truthy
        end
      end
    end
  end
end
