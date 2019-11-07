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
      context 'evaluates to true' do
        context 'always' do
          context 'array' do
            describe '#my_all?' do
              it 'should return true' do
                expect(array.my_all? { true }).to be_truthy
              end
            end

            describe '#my_none?' do
              it 'should return false' do
                expect(array.my_none? { true }).to be_falsy
              end
            end

            describe '#my_any?' do
              it 'should returns true' do
                expect(array.my_any? { true }).to be_truthy
              end
            end
          end

          context 'range' do
            describe '#my_all?' do
            end

            describe '#my_none?' do
            end

            describe '#my_any?' do
            end
          end

          context 'hash' do
          end
        end

        context 'not always' do
          context 'array' do
            describe '#my_all?' do
              it 'should be false' do
                counter = 0
                condition = true
                expect(
                  array.my_all? do
                    counter += 1
                    condition = false if counter.eql?(3)
                    condition
                  end
                ).to be_falsy
              end
            end

            describe '#my_none?' do
              it 'should be false' do
                counter = 0
                condition = true
                expect(
                  array.my_all? do
                    counter += 1
                    condition = false if counter.eql?(3)
                    condition
                  end
                ).to be_falsy
              end
            end

            describe '#my_any?' do
              it 'should be true' do
                counter = 0
                condition = true
                expect(
                  array.my_all? do
                    counter += 1
                    condition = false if counter.eql?(3)
                    condition
                  end
                ).to be_truthy
              end
            end
          end

          context 'range' do
          end

          context 'hash' do
          end
        end
      end

      context 'evaluates to false' do
        context 'always' do
          describe '#my_all?' do
          end

          describe '#my_none?' do
          end

          describe '#my_any?' do
          end
        end

        context 'not always' do
          describe '#my_all?' do
          end

          describe '#my_none?' do
          end

          describe '#my_any?' do
          end
        end
      end
    end
    context 'with 1 variable' do
    end
    context 'with 2 variables' do
    end
    context 'with more than 2 variables' do
    end
  end
end
