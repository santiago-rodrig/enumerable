# frozen_string_literal: true

require_relative '../enumerable.rb'

# we will build test cases for the following functions
# - my_all
# - my_any
# - my_none

describe Enumerable do
  let(:array) { [1, 2, 3, 4, 5] }
  let(:array_of_strings) { %w[dog cat lion] }
  let(:hash) { { 'name' => 'mohamed', 'age' => '20' } }
  let(:hash_strings) { { 'name' => 'moahmed', 'school' => 'cairo school', 'age' => '25' } }
  let(:range) { (1..10) }

  context 'with arguments' do
    it 'with regular expression argument ' do
      expect(array_of_strings.my_all?(/z/)).to_not be_truthy
      expect(array_of_strings.my_all?(/./)).to be_truthy

      expect(hash_strings.my_all?(/z/)).to_not be_truthy
      expect(hash_strings.my_all?(/./)).to be_truthy

      expect(range.my_all?(/z/)).to_not be_truthy
    end

    it 'With class argument ' do
      expect(array_of_strings.my_all?(Integer)).to_not be_truthy
      expect(array_of_strings.my_all?(String)).to be_truthy

      expect(hash_strings.my_all?(Integer)).to_not be_truthy
      expect(hash_strings.my_all?(String)).to be_truthy

      expect(range.my_all?(String)).to_not be_truthy
      expect(range.my_all?(Integer)).to be_truthy
    end
  end
  context 'with empty argument ' do
    it 'with empty array ' do
      expect([].my_all?).to be_truthy
      expect({}.my_all?).to be_truthy
      expect((0..-1).my_all?).to be_truthy
    end
    it 'with not empty array ' do
      expect(array.my_all?).to be_truthy
      expect(hash.my_all?).to be_truthy
      expect(range.my_all?).to be_truthy
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
