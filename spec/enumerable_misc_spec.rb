# frozen_string_literal: true

require_relative '../enumerable.rb'

# we will build test cases for the following functions
# - my_count
# - my_inject
# - my_map

describe Enumerable do
  let(:array) { [1, 2, 3, 4, 5] }
  let(:hash) { { 'name' => 'mohamed', 'age' => 20 } }
  let(:range) { (1..10) }

  context 'with arguments' do
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
