# frozen_string_literal: true

require_relative '../enumerable'

describe '#my_map' do
  let(:array) { [1, 2, 67, -23, %w[array inside], { crazy: 'hash', insane: true }, 3.13] }
  let(:range) { 1..98 }
  let(:hash) { { name: 'roberta', job: 'musician', age: 21, hobby: 'cats' } }
  let(:test_array) { [] }

  context 'with arguments' do
    context 'an array' do
      it 'raises ArgumentError' do
        expect { array.my_map(1, '2', :three) }.to raise_error(ArgumentError)
      end
    end

    context 'a range' do
      it 'raises ArgumentError' do
        expect { range.my_map(1, '2', :three) }.to raise_error(ArgumentError)
      end
    end

    context 'a hash' do
      it 'raises ArgumentError' do
        expect { hash.my_map(1, '2', :three) }.to raise_error(ArgumentError)
      end
    end
  end

  # rubocop:disable Metrics/BlockLength
  context 'with a block of 0 variables' do
    subject { collection.my_map { 3.1415926539 } }

    context 'an array' do
      let(:collection) { array }

      it 'returns an array' do
        should be_instance_of(Array)
      end

      it 'all the elements are equal' do
        should be_all(eq(3.1415926539))
      end
    end

    context 'a range' do
      let(:collection) { range }

      it 'returns an array' do
        should be_instance_of(Array)
      end

      it 'all the elements are equal' do
        should be_all(eq(3.1415926539))
      end
    end

    context 'a hash' do
      let(:collection) { hash }

      it 'returns an array' do
        should be_instance_of(Array)
      end

      it 'all the elements are equal' do
        should be_all(eq(3.1415926539))
      end
    end
  end

  context 'with a block of 1 variable' do
    subject { collection.my_map { |variable| variable.to_s + ' is mapped' } }
    let(:as_array) { collection.to_a }

    context 'array' do
      let(:collection) { array }

      it 'yields its values' do
        collection.my_map { |variable| test_array << variable }
        expect(test_array).to eq(collection)
      end

      it 'returns an array' do
        should be_instance_of(Array)
      end

      it 'is not the same array' do
        expect(subject.object_id).not_to eq(array.object_id)
      end

      it 'maps each element' do
        should be_all(end_with(' is mapped'))
      end
    end

    context 'range' do
      let(:collection) { range }

      it 'yields its integers' do
        collection.my_map { |variable| test_array << variable }
        expect(test_array).to eq(as_array)
      end

      it 'returns an array' do
        should be_instance_of(Array)
      end

      it 'maps each integer' do
        should be_all(end_with(' is mapped'))
      end
    end

    context 'hash' do
      let(:collection) { hash }

      it 'yield its key-value pairs' do
        collection.my_map { |variable| test_array << variable }
        expect(test_array).to eq(as_array)
      end

      it 'returns an array' do
        should be_instance_of(Array)
      end

      it 'maps each key-value pair' do
        should be_all(end_with(' is mapped'))
      end
    end
  end
  # rubocop:enable Metrics/BlockLength

  context 'with a block of 2 variables' do
    subject { hash.my_map { |key, value| "key: #{key}, value: #{value}" } }

    context 'hash' do
      it 'yields its keys and values' do
        hash.my_map { |key, value| test_array.push(key, value) }
        expect(test_array).to eq(hash.to_a.flatten)
      end

      it 'returns an array' do
        should be_instance_of(Array)
      end

      it 'maps each key and value' do
        should be_all(start_with('key:'))
      end
    end
  end
end
