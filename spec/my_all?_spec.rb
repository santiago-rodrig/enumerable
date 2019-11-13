# frozen_string_literal: true

describe '#my_all?' do
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
        expect([].my_all?).to be_truthy
      end
    end

    context 'hash' do
      it 'returns true' do
        expect({}.my_all?).to be_truthy
      end
    end

    context 'range' do
      it 'returns true' do
        expect((0..-1).my_all?).to be_truthy
      end
    end
  end

  # rubocop:disable Metrics/BlockLength
  context 'with 1 argument' do
    context 'the argument is a regular expression' do
      context 'all the elements match' do
        context 'array' do
          it 'should return true' do
            expect(array_words.my_all?(/\w/)).to be_truthy
          end
        end
      end

      context "at least 1 element doesn't match" do
        context 'array' do
          it 'should return false' do
            expect(array.my_all?(/k/)).to be_falsy
          end
        end

        context 'hash' do
          it 'should return false' do
            expect(hash.my_all?(/./)).to be_falsy
          end
        end

        context 'range' do
          it 'should return false' do
            expect(range.my_all?(/./)).to be_falsy
          end
        end
      end
    end

    context 'the argument is a class' do
      context 'all the elements pertain to the class' do
        context 'array' do
          it 'should return true' do
            expect(array.my_all?(Object)).to be_truthy
          end
        end

        context 'hash' do
          it 'should return true' do
            expect(hash.my_all?(Array)).to be_truthy
          end
        end

        context 'range' do
          it 'should return true' do
            expect(range.my_all?(Integer)).to be_truthy
          end
        end
      end

      context "at least one element doesn't pertain to the same class" do
        context 'array' do
          it 'should return false' do
            expect(array.my_all?(Symbol)).to be_falsy
          end
        end

        context 'hash' do
          it 'should return false' do
            expect(hash.my_all?(Float)).to be_falsy
          end
        end

        context 'range' do
          it 'should return false' do
            expect(range.my_all?(String)).to be_falsy
          end
        end
      end
    end

    context 'the argument is an instance' do
      context 'all the elements are equal' do
        context 'array' do
          it 'should return true' do
            expect(array_falses.my_all?(false)).to be_truthy
          end
        end

        context 'hash' do
          it 'should return true' do
            expect(hash_one_pair.my_all?([:destiny, 'greatness'])).to be_truthy
          end
        end

        context 'range' do
          it 'should return true' do
            expect(range_one_integer.my_all?(1)).to be_truthy
          end
        end
      end

      context 'at least 1 element is different' do
        context 'array' do
          it 'should return false' do
            expect(array.my_all?(2)).to be_falsy
          end
        end

        context 'hash' do
          it 'should return false' do
            expect(hash.my_all?(%w[thanos exists])).to be_falsy
          end
        end

        context 'range' do
          it 'should return false' do
            expect(range.my_all?(56)).to be_falsy
          end
        end
      end
    end
  end
  # rubocop:enable Metrics/BlockLength

  context 'with more than 1 argument' do
    context 'array' do
      it 'should raise ArgumentError' do
        expect { array.my_all?(1, 2, '3') }.to raise_error(ArgumentError)
      end
    end

    context 'hash' do
      it 'should raise ArgumentError' do
        expect { hash.my_all?(1, 2, '3') }.to raise_error(ArgumentError)
      end
    end

    context 'range' do
      it 'should raise ArgumentError' do
        expect { range.my_all?(1, 2, '3') }.to raise_error(ArgumentError)
      end
    end
  end

  context 'without a block' do
    context 'all elements evaluate to true' do
      context 'array' do
        it 'should return true' do
          expect(array.my_all?).to be_truthy
        end
      end

      context 'hash' do
        it 'should return true' do
          expect(hash.my_all?).to be_truthy
        end
      end

      context 'range' do
        it 'should return true' do
          expect(range.my_all?).to be_truthy
        end
      end
    end

    context 'at least 1 element evaluates to false' do
      context 'array' do
        it 'returns false' do
          expect(array_nil.my_all?).to be_falsy
        end
      end
    end
  end

  # rubocop:disable Metrics/BlockLength
  context 'with a block of 0 variables' do
    context 'the block always evaluates to true' do
      context 'array' do
        it 'should return true' do
          expect(array.my_all? { true }).to be_truthy
        end
      end

      context 'hash' do
        it 'should return true' do
          expect(hash.my_all? { true }).to be_truthy
        end
      end

      context 'range' do
        it 'should return true' do
          expect(range.my_all? { true }).to be_truthy
        end
      end
    end

    context 'the block not always evaluates to true' do
      def get_bool(collection)
        condition = true
        counter = 0
        collection.my_all? do
          counter += 1
          condition = false if counter.eql?(3)
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
        array.my_all? { |value| test_array << value }
        expect(test_array).to eq(array)
      end
    end

    context 'hash' do
      it 'should yield the pairs' do
        hash.my_all? { |pair| test_array << pair }
        expect(test_array).to eq(hash.to_a)
      end
    end

    context 'range' do
      it 'should yield the integers' do
        range.my_all? { |integer| test_array << integer }
        expect(test_array).to eq(range.to_a)
      end
    end

    context 'the block always evaluates to true' do
      context 'array' do
        it 'should return true' do
          expect(array.my_all? { |value| !value.nil? }).to be_truthy
        end
      end

      context 'hash' do
        it 'should return true' do
          expect(hash.my_all? { |pair| pair.instance_of?(Array) }).to be_truthy
        end
      end

      context 'range' do
        it 'should return true' do
          expect(range.my_all? { |integer| !integer.eql?(3.1415926539) }).to be_truthy
        end
      end
    end

    context 'the block not always evaluates to true' do
      context 'array' do
        it 'should return false' do
          expect(array.my_all? { |value| value == 3 }).to be_falsy
        end
      end

      context 'hash' do
        it 'should return false' do
          expect(hash.my_all? { |pair| pair.include?('thanos') }).to be_falsy
        end
      end

      context 'range' do
        it 'should return false' do
          expect(range.my_all? { |integer| integer.eql?(98) }).to be_falsy
        end
      end
    end
  end
  # rubocop:enable Metrics/BlockLength

  context 'with a block of 2 variables' do
    context 'hash' do
      it 'should yield key and value' do
        hash.my_all? { |key, value| test_array.push(key, value) }
        expect(test_array).to eq(hash.to_a.flatten)
      end
    end

    context 'the block always evaluates to true' do
      context 'hash' do
        it 'returns true' do
          expect(hash.my_all? { |key, value| key.is_a?(Object) && value.is_a?(String) }).to be_truthy
        end
      end
    end

    context 'the block not always evaluates to true' do
      context 'hash' do
        it 'returns false' do
          expect(hash.my_all? { |key, value| key.eql?('thanos') && value == 'exists' }).to be_falsy
        end
      end
    end
  end
end
