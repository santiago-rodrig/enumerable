# frozen_string_literal: true

require_relative './../enumerable.rb'

describe 'enumerable' do
  context 'looping' do
    let(:numbers_array) { [1, 2, 3, 4, 5, 6] }
    let(:string_array) { %w[dog cat elaphant lion] }
    let(:mixed_array) { numbers_array + string_array }

    describe '#my_each' do
      it 'loop array of numbers ' do
        temp_array = []
        numbers_array.my_each { |element| temp_array << element }

        expect(temp_array).to eq(numbers_array)
      end
    end
  end

  describe 'conditional' do
  end
end
