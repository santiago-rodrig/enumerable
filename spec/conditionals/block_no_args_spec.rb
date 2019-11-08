# frozen_string_literal: true

require_relative '../../enumerable'

describe Enumerable do
  let(:array) { [1, 2, 3, 'dog', 'cow', :symbol, (1..10), { name: 'antonio', job: 'engineer' }] }
  let(:array_of_numbers) { [1, 2, 3, 4, 5] }
  let(:array_of_strings) { %w[dog cat lion] }
  let(:hash) { { name: 'mohamed', job: 'developer' } }
  let(:range) { (1..10) }

  context 'with a block and no arguments' do
    context 'any number of variables' do
      context 'array, range, or hash' do
        context 'empty' do
          describe '#my_all?' do
            it 'should return true' do
              expect([].my_all? { false }).to be_truthy
              expect([].my_all? { |foo| foo }).to be_truthy
              expect([].my_all? { |foo, bar| bar }).to be_truthy
              expect([].my_all? { |foo, bar, baz| baz }).to be_truthy
              # empty range
              expect((0..-1).my_all? { false }).to be_truthy
              expect((0..-1).my_all? { |foo| foo }).to be_truthy
              expect((0..-1).my_all? { |foo, bar| bar }).to be_truthy
              expect((0..-1).my_all? { |foo, bar, baz| baz }).to be_truthy
              # empty hash
              expect({}.my_all? { false }).to be_truthy
              expect({}.my_all? { |foo| foo }).to be_truthy
              expect({}.my_all? { |foo, bar| bar }).to be_truthy
              expect({}.my_all? { |foo, bar, baz| baz }).to be_truthy
            end
          end

          describe '#my_none?' do
            it 'should return true' do
              expect([].my_all? { true }).to be_truthy
              expect([].my_all? { |foo| !foo }).to be_truthy
              expect([].my_all? { |foo, bar| !bar }).to be_truthy
              expect([].my_all? { |foo, bar, baz| !baz }).to be_truthy
              # empty range
              expect((0..-1).my_all? { true }).to be_truthy
              expect((0..-1).my_all? { |foo| !foo }).to be_truthy
              expect((0..-1).my_all? { |foo, bar| !bar }).to be_truthy
              expect((0..-1).my_all? { |foo, bar, baz| !baz }).to be_truthy
              # empty hash
              expect({}.my_all? { true }).to be_truthy
              expect({}.my_all? { |foo| !foo }).to be_truthy
              expect({}.my_all? { |foo, bar| !bar }).to be_truthy
              expect({}.my_all? { |foo, bar, baz| !baz }).to be_truthy
            end
          end

          describe '#my_any?' do
            it 'should return false' do
              expect([].my_all? { true }).to be_falsy
              expect([].my_all? { |foo| !foo }).to be_falsy
              expect([].my_all? { |foo, bar| !bar }).to be_falsy
              expect([].my_all? { |foo, bar, baz| !baz }).to be_falsy
              # empty range
              expect((0..-1).my_all? { true }).to be_falsy
              expect((0..-1).my_all? { |foo| !foo }).to be_falsy
              expect((0..-1).my_all? { |foo, bar| !bar }).to be_falsy
              expect((0..-1).my_all? { |foo, bar, baz| !baz }).to be_falsy
              # empty hash
              expect({}.my_all? { true }).to be_falsy
              expect({}.my_all? { |foo| !foo }).to be_falsy
              expect({}.my_all? { |foo, bar| !bar }).to be_falsy
              expect({}.my_all? { |foo, bar, baz| !baz }).to be_falsy
            end
          end
        end
      end
    end

    context 'block without variables' do
      def get_bool(method, data_structure, condition = true)
        counter = 0
        data_structure.method(method).call do
          counter += 1
          condition = !condition if counter.eql?(3)
        end
      end

      context 'array, range, or hash' do
        context 'nonempty' do
          context 'block always evaluates to true' do
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

          context 'block not always evaluates to true' do
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

          context 'block always evaluates to false' do
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

          context 'block not always evaluates to false' do
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

    context 'block with 1 variable' do
      context 'hash' do
        context 'nonempty' do
          context 'all arrays of key-value pairs meet the condition' do
            describe '#my_all?' do
              it 'should return true' do
                expect(hash.my_all? { |v| v.is_a? Array }.to be_truthy
              end
            end

            describe '#my_none?' do
              it 'should return false' do
                expect(hash.my_none? { |v| v.is_a? Array }.to be_falsy
              end
            end

            describe '#my_any?' do
              it 'should return true' do
                expect(hash.my_any? { |v| v.is_a? Array }.to be_truthy
              end
            end
          end

          context 'some arrays of key-value pairs meet the condition' do
            describe '#my_all?' do
              it 'should return false' do
                expect(hash.my_all? { |v| v[0].eql? :job }).to be_falsy
              end
            end

            describe '#my_none?' do
              it 'should return false' do
                expect(hash.my_none? { |v| v[0].eql? :job }).to be_falsy
              end
            end

            describe '#my_any?' do
              it 'should return true' do
                expect(hash.my_any? { |v| v[0].eql? :job }).to be_truthy
              end
            end
          end

          context 'none of the arrays of key-value pairs meet the condition' do
            describe '#my_all?' do
              it 'should return false' do
                expect(hash.my_all? { |v| v[1].eql? 'thanos' }).to be_falsy
              end
            end

            describe '#my_none?' do
              it 'should return true' do
                expect(hash.my_none? { |v| v[1].eql? 'thanos' }).to be_truthy
              end
            end

            describe '#my_any?' do
              it 'should return false' do
                expect(hash.my_any? { |v| v[1].eql? 'thanos' }).to be_falsy
              end
            end
          end
        end
      end
    end

    context 'block with at least one variable' do
      context 'array or range' do
        context 'nonempty' do
          context 'all elements meet the condition' do
            describe '#my_all?' do
              it 'should return true' do
                expect(array_of_strings.my_all? { |v| v.instance_of? String }).to be_truthy
                expect(range.my_all? { |v| v.instance_of? Integer }).to be_truthy
              end
            end

            describe '#my_none?' do
              it 'should return false' do
                expect(array_of_strings.my_none? { |v| v.instance_of? String }).to be_falsy
                expect(range.my_none? { |v| v.instance_of? Integer }).to be_falsy
              end
            end

            describe '#my_any?' do
              it 'should return true' do
                expect(array_of_strings.my_any? { |v| v.instance_of? String }).to be_truthy
                expect(range.my_any? { |v| v.instance_of? Integer }).to be_truthy
              end
            end
          end

          context 'some elements meet the condition' do
            describe '#my_all?' do
              it 'should return false' do
                expect(array.my_all? { |v| v.instance_of? Symbol }).to be_falsy
                expect(range.my_all? { |v| v > 5 }).to be_falsy
              end
            end

            describe '#my_none?' do
              it 'should return false' do
                expect(array.my_none? { |v| v.instance_of? Symbol }).to be_falsy
                expect(range.my_none? { |v| v > 5 }).to be_falsy
              end
            end

            describe '#my_any?' do
              it 'should return true' do
                expect(array.my_any? { |v| v.instance_of? Symbol }).to be_truthy
                expect(range.my_any? { |v| v > 5 }).to be_truthy
              end
            end
          end

          context 'none of the elements meet the condition' do
            describe '#my_all?' do
              it 'should return false' do
                expect(array_of_numbers.my_all? { |v| v == 3.56713 }).to be_falsy
                expect(range.my_all? { |v| v.is_a? Proc }).to be_falsy
              end
            end

            describe '#my_none?' do
              it 'should return true' do
                expect(array_of_numbers.my_none? { |v| v == 3.56713 }).to be_truthy
                expect(range.my_none? { |v| v.is_a? Proc }).to be_truthy
              end
            end

            describe '#my_any?' do
              it 'should return false' do
                expect(array_of_numbers.my_any? { |v| v == 3.56713 }).to be_falsy
                expect(range.my_any? { |v| v.is_a? Proc }).to be_falsy
              end
            end
          end
        end
      end
    end

    context 'block with at least 2 variables' do
      context 'hash' do
        context 'nonempty' do
          context 'all of the key-value pairs meet the condition' do
            describe '#my_all?' do
              it 'should return true' do
                expect(hash.my_all? { |k, v| k.is_a?(Symbol) && v.instance_of?(String) }).to be_truthy
              end
            end

            describe '#my_none?' do
              it 'should return false' do
                expect(hash.my_none? { |k, v| k.is_a?(Symbol) && v.instance_of?(String) }).to be_falsy
              end
            end

            describe '#my_any?' do
              it 'should return true' do
                expect(hash.my_any? { |k, v| k.is_a?(Symbol) && v.instance_of?(String) }).to be_truthy
              end
            end
          end

          context 'some of the key-value pairs meet the condition' do
            describe '#my_all?' do
              it 'should return false' do
                expect(hash.my_all? { |k, v| k.eql? :name }).to be_falsy
              end
            end

            describe '#my_none?' do
              it 'should return false' do
                expect(hash.my_none? { |k, v| k.eql? :name }).to be_falsy
              end
            end

            describe '#my_any?' do
              it 'should return true' do
                expect(hash.my_any? { |k, v| k.eql? :name }).to be_truthy
              end
            end
          end

          context 'none of the key-value pairs meet the condition' do
            describe '#my_all?' do
              it 'should return false' do
                expect(hash.my_all? { |k, v| k.instance_of? Proc }).to be_falsy
              end
            end

            describe '#my_none?' do
              it 'should return true' do
                expect(hash.my_none? { |k, v| k.instance_of? Proc }).to be_truthy
              end
            end

            describe '#my_any?' do
              it 'should return false' do
                expect(hash.my_any? { |k, v| k.instance_of? Proc }).to be_falsy
              end
            end
          end
        end
      end
    end
  end
end
