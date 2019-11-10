# frozen_string_literal: true

require_relative '../enumerable'

describe '#my_map' do
  let(:array) { [1, 2, 67, -23, ['array', 'inside'], { crazy: 'hash', insane: true }, 3.13] }
  let(:range) { 1..98 }
  let(:hash) { { name: 'roberta', job: 'musician', age: 21, hobby: 'cats' } }

  context 'with arguments' do
    subject { collection.my_map(1, '2', :three) }

    context 'an array' do
      let(:collection) { array }

      it 'raises ArgumentError' do
        should raise_error(ArgumentError)
      end
    end

    context 'a range' do
      let(:collection) { range }

      it 'raises ArgumentError' do
        should raise_error(ArgumentError)
      end
    end

    context 'a hash' do
      let(:collection) { hash }

      it 'raises ArgumentError' do
        should raise_error(ArgumentError)
      end
    end
  end

  context 'with a block of 0 variables' do
  end

  context 'with a block of 1 variable' do
  end

  context 'with a block of 2 variables' do
  end
end
