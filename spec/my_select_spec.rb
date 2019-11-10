# frozen_string_literal: true

require '../enumerable'

describe '#my_select' do
  let(:array) { [1, 2, 3, 3, 6, 9, 2, 'yes', 'no', :a, :b, :c, :c, true, false, nil, nil, nil, { name: 'susan' }] }
  let(:range) { 1..968 }
  let(:hash) { { car: '198-786-998', member: true, vip: false, started: 2010, age: 32, employed: true } }
  let(:test_array) { [] }

  context 'arguments given' do
    context 'an array' do
      it 'should raise ArgumentError' do
        expect { array.my_select('argument here') }.to raise_error(ArgumentError)
      end
    end

    context 'a range' do
      it 'should raise ArgumentError' do
        expect { range.my_select('argument here') }.to raise_error(ArgumentError)
      end
    end

    context 'a hash' do
      it 'should raise ArgumentError' do
        expect { hash.my_select('argument here') }.to raise_error(ArgumentError)
      end
    end
  end

  context 'no block given' do
    context 'an array' do
      it 'should return an Enumerator' do
        expect(array.my_select).to be_instance_of(Enumerator)
      end
    end

    context 'a range' do
      it 'should return an Enumerator' do
        expect(range.my_select).to be_instance_of(Enumerator)
      end
    end

    context 'a hash' do
      it 'should return an Enumerator' do
        expect(hash.my_select).to be_instance_of(Enumerator)
      end
    end
  end

  # rubocop:disable Metrics/BlockLength
  context 'given a block with 0 variables' do
    context 'that always evaluates to true' do
      context 'an array' do
        it 'should return a copy of the array' do
          expect(array.my_select { true }).to eq(array)
        end
      end

      context 'a range' do
        it 'should return a copy of the range as an array' do
          expect(range.my_select { true }).to eq(range.to_a)
        end
      end

      context 'a hash' do
        it 'should return a copy of the hash' do
          expect(hash.my_select { true }).to eq(hash)
        end
      end
    end

    context 'that not always evaluates to true' do
      def get_some(collection)
        counter = 0
        condition = true
        collection.my_select do
          condition = false if counter % 3 == 0
          condition = true unless counter % 3 == 0
          counter += 1
        end
      end

      context 'an array' do
        some = get_some(array)

        it 'should return some of its values' do
          expect(some.all? { |value| array.include?(value) }).to be_truthy
        end

        it 'should return less values' do
          expect(some.size).to be < array.size
        end

        it 'should return an array' do
          expect(some).to be_instance_of(Array)
        end
      end

      context 'a range' do
        some = get_bool(range)

        it 'should return some of its integers' do
          expect(some.all? { |value| range.include?(value) }).to be_truthy
        end

        it 'should return less integers' do
          expect(some.size).to be < range.size
        end

        it 'should return an array' do
          expect(some).to be_instance_of(Array)
        end
      end

      context 'a hash' do
        some = get_some(hash)
        as_array = hash.to_a

        it 'should return a hash' do
          expect(some).to be_instance_of(Hash)
        end

        it 'should return some of its values' do
          expect(some.all? { |pair| as_array.include?(pair) }).to be_truthy
        end

        it 'should return less key-value pairs' do
          expect(some.size).to be < hash.size
        end
      end
    end

    context 'that always evaluates to false' do
      context 'an array' do
        it 'should return an empty collection' do
          expect(array.my_select { false }).to be_empty
        end

        it 'should return an array' do
          expect(array.my_select { false }).to be_instance_of(Array)
        end
      end

      context 'a range' do
        it 'should return an empty collection' do
          expect(range.my_select { false }).to be_empty
        end

        it 'should return an array' do
          expect(range.my_select { false }).to be_instance_of(Array)
        end
      end

      context 'a hash' do
        it 'should return an empty collection' do
          expect(hash.my_select { false }).to be_empty
        end

        it 'should return a hash' do
          expect(hash.my_select { false }).to be_instance_of(Hash)
        end
      end
    end
  end

  context 'given a block with 1 variable' do
    context 'an array' do
      it 'should yield its values' do
        array.my_select { |value| test_array << value }
        expect(test_array).to eq(array)
      end
    end

    context 'a range' do
      it 'should yield its integers' do
        range.my_select { |integer| test_array << integer }
        expect(test_array).to eq(range.to_a)
      end
    end

    context 'a hash' do
      it 'should yield its key-value pairs' do
        hash.my_select { |pair| test_array << pair }
        expect(test_array).to eq(hash.to_a)
      end
    end

    context 'that always evaluates to true using the variable' do
      context 'an array' do
        it 'should return a copy of the array' do
          expect(array.my_select { |value| value.is_a?(Object) }).to eq(array)
        end
      end

      context 'a range' do
        it 'should return an array version of the range' do
          expect(range.my_select { |integer| integer % 1 == 0 }).to eq(range.to_a)
        end
      end

      context 'a hash' do
        it 'should return a copy of the hash' do
          expect(hash.my_select { |pair| pair.size == 2 }).to eq(hash)
        end
      end
    end

    context 'that not always evaluates to true using the variable' do
      context 'an array' do
        subject { array.my_select { |value| !value.instance_of?(NilClass) } }

        it 'returns values in the array' do
          expect(subject.all? { |value| array.include?(value) }).to be_truthy
        end

        it 'returns an array' do
          should be_a(Array)
        end

        it "doesn't return a copy of the array" do
          should_not eq(Array)
        end
      end

      context 'a range' do
        subject { range.my_select { |integer| integer % 5 == 0 } }

        it 'returns integers in the range' do
          expect(subject.all? { |integer| range.include?(integer) }).to be_truthy
        end

        it 'returns an array' do
          should be_a(Array)
        end

        it "doesn't return a copy of the array version of the range" do
          should_not eq(range.to_a)
        end
      end

      context 'a hash' do
        subject { hash.my_select { |pair| pair[1].is_a?(String) } }

        it 'returns pairs in the array version of the hash' do
          as_array = hash.to_a
          expect(subject.all? { |pair| as_array.include?(pair) }).to be_truthy
        end

        it 'returns a hash' do
          should be_a(Hash)
        end

        it "doesn't return a copy of the hash" do
          should_not eq(hash)
        end
      end
    end

    context 'that always evaluates to false using the variable' do
      context 'an array' do
        subject { array.my_select { |value| value == 'spongebob' } }

        it 'returns an empty collection' do
          should be_empty
        end

        it 'returns an array' do
          should be_a(Array)
        end
      end

      context 'a range' do
        subject { range.my_select { |integer| integer == 3.1 } }

        it 'returns an empty collection' do
          should be_empty
        end

        it 'returns an array' do
          should be_a(Array)
        end
      end

      context 'a hash' do
        subject { hash.my_select { |pair| pair.size > 3 } }

        it 'returns an empty collection' do
          should be_empty
        end

        it 'returns a hash' do
          should be_a(Hash)
        end
      end
    end
  end

  context 'given a block with 2 variables' do
    context 'a hash' do
      it 'should yield key and value for each pair' do
        hash.my_select { |key, value| test_array.push(key, value) }
        expect(test_array).to eq(hash.to_a.flatten)
      end
    end

    context 'that always evaluates to true using the two variables' do
      context 'a hash' do
        subject { hash.my_select { |key, value| key || value } }

        it 'should return a copy of the hash' do
          should eq(hash)
        end
      end
    end

    context 'that not always evaluates to true using the two variables' do
      context 'a hash' do
        subject { hash.my_select { |key, value| key != age && value != 32 } }

        it 'returns keys and values included in the hash' do
          as_array = hash.to_a
          expect(subject.all? { |pair| as_array.include?(pair) }).to be_truthy
        end

        it 'returns a hash' do
          should be_a(Hash)
        end

        it 'returns different hash' do
          should_not eq(hash)
        end
      end
    end

    context 'that always evaluates to false using the two variables' do
      context 'a hash' do
        subject { hash.my_select { |key, value| key.is_a?(Proc) && value.instance_of?(Method) } }

        it 'returns a hash' do
          should be_a(Hash)
        end

        it 'returns an empty collection' do
          should be_empty
        end
      end
    end
  end
  # rubocop:enable Metrics/BlockLength
end
