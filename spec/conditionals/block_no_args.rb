# frozen_string_literal: true

require_relative '../enumerable'

describe Enumerable do
  let(:array) { [1, 2, 3, 'dog', 'cow', :symbol, (1..10), { name: 'antonio', job: 'engineer' }] }
  let(:array_of_numbers) { [1, 2, 3, 4, 5] }
  let(:array_of_strings) { %w[dog cat lion] }
  let(:array_of_nils) { [nil, nil, nil] }
  let(:array_with_one_nil) { [1, nil, 3] }
  let(:hash) { { name: 'mohamed', job: 'developer' } }
  let(:hash_of_strings) { { 'name' => 'moahmed', 'school' => 'cairo school', 'age' => '25' } }
  let(:range) { (1..10) }

  context 'with a block and no arguments' do
    context 'without variables' do
      def get_bool(method, data_structure, condition = true)
        counter = 0
        data_structure.method(method).call do
          counter += 1
          condition = !condition if counter.eql?(3)
        end
      end

      context 'evaluates to true' do
        context 'always' do
          context 'array, range, or hash' do
            describe '#my_all?' do
              it 'should return true' do
                expect(array.my_all? { true }).to be_truthy
                expect(range.my_all? { true }).to be_truthy
                expect(hash.my_all? { true }).to be_truthy
              end
            end

            describe '#my_none?' do
              it 'should return false' do
                expect(array.my_none? { true }).to be_falsy
                expect(range.my_none? { true }).to be_falsy
                expect(hash.my_none? { true }).to be_falsy
              end
            end

            describe '#my_any?' do
              it 'should returns true' do
                expect(array.my_any? { true }).to be_truthy
                expect(range.my_any? { true }).to be_truthy
                expect(hash.my_any? { true }).to be_truthy
              end
            end
          end
        end

        context 'not always' do
          context 'array, range, or hash' do
            describe '#my_all?' do
              it 'should be false' do
                expect(get_bool :my_all?, array).to be_falsy
                expect(get_bool :my_all?, range).to be_falsy
                expect(get_bool :my_all?, hash).to be_falsy
              end
            end

            describe '#my_none?' do
              it 'should be false' do
                expect(get_bool :my_none?, array).to be_falsy
                expect(get_bool :my_none?, range).to be_falsy
                expect(get_bool :my_none?, hash).to be_falsy
              end
            end

            describe '#my_any?' do
              it 'should be true' do
                expect(get_bool :my_any?, array).to be_truthy
                expect(get_bool :my_any?, range).to be_truthy
                expect(get_bool :my_any?, hash).to be_truthy
              end
            end
          end
        end
      end

      context 'evaluates to false' do
        context 'always' do
          context 'array, range, or hash' do
            describe '#my_all?' do
              it 'should return false' do
                expect(array.my_all? { false }).to be_falsy
                expect(range.my_all? { false }).to be_falsy
                expect(hash.my_all? { false }).to be_falsy
              end
            end

            describe '#my_none?' do
              it 'should return true' do
                expect(array.my_none? { false }).to be_truthy
                expect(range.my_none? { false }).to be_truthy
                expect(hash.my_none? { false }).to be_truthy
              end
            end

            describe '#my_any?' do
              it 'should return false' do
                expect(array.my_any? { false }).to be_falsy
                expect(range.my_any? { false }).to be_falsy
                expect(hash.my_any? { false }).to be_falsy
              end
            end
          end
        end

        context 'not always' do
          context 'array, range, or hash' do
            describe '#my_all?' do
              it 'should return false' do
                expect(get_bool :my_all?, array, false).to be_falsy
                expect(get_bool :my_all?, range, false).to be_falsy
                expect(get_bool :my_all?, hash, false).to be_falsy
              end
            end

            describe '#my_none?' do
              it 'should return false' do
                expect(get_bool :my_none?, array, false).to be_falsy
                expect(get_bool :my_none?, range, false).to be_falsy
                expect(get_bool :my_none?, hash, false).to be_falsy
              end
            end

            describe '#my_any?' do
              it 'should return true' do
                expect(get_bool :my_any?, array, false).to be_truthy
                expect(get_bool :my_any?, range, false).to be_truthy
                expect(get_bool :my_any?, hash, false).to be_truthy
              end
            end
          end
        end
      end
    end

    context 'with 1 variable' do
      context 'array and range' do
      end

      context 'hash' do
      end
    end

    context 'with 2 variables' do
      context 'array and range' do
      end

      context 'hash' do
      end
    end

    context 'with more than 2 variables' do
      context 'array and range' do
      end

      context 'hash' do
      end
    end
  end
end
