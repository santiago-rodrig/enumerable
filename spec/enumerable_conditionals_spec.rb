# frozen_string_literal: true

require_relative '../enumerable.rb'

describe Enumerable do
  let(:array) { [1, 2, 3, 'dog', 'cow', :symbol, (1..10), { name: 'antonio', job: 'engineer' }] }
  let(:array_of_numbers) { [1, 2, 3, 4, 5] }
  let(:array_of_strings) { %w[dog cat lion] }
  let(:array_of_nils) { [nil, nil, nil] }
  let(:array_with_one_nil) { [1, nil, 3] }
  let(:hash) { { name: 'mohamed', job: 'developer' } }
  let(:hash_of_strings) { { 'name' => 'moahmed', 'school' => 'cairo school', 'age' => '25' } }
  let(:range) { (1..10) }

  context 'without block' do
    context 'with arguments' do
      context '1 argument' do
        context 'regular expression' do
          context 'array' do
            context 'nonempty' do
              context 'is made of strings' do
                context 'all the strings match' do
                  describe '#my_all?' do
                    it 'should return true' do
                      expect(array_of_strings.my_all?(/\w+/)).to be_truthy
                    end
                  end

                  describe '#my_none?' do
                    it 'should return false' do
                      expect(array_of_strings.my_all? /\w/).to be_falsy
                    end
                  end

                  describe '#my_any?' do
                    it 'should return true' do
                      expect(array_of_strings.my_all? /\w/).to be_truthy
                    end
                  end
                end # all the strings match

                context "one or more strings don't match" do
                  context "some strings don't match, but not all" do
                    describe '#my_all?' do
                      it 'should be false' do
                        expect(array_of_strings.my_all? /d/).to be_falsy
                      end
                    end

                    describe '#my_none?' do
                      it 'should be false' do
                        expect(array_of_strings.my_none? /d/).to be_falsy
                      end
                    end

                    describe '#my_any?' do
                      it 'should be true' do
                        expect(array_of_strings.my_any? /d/).to be_truthy
                      end
                    end
                  end # some strings don't match, but not all

                  context "none of the strings match" do
                    describe '#my_all?' do
                      it 'should be false' do
                        expect(array_of_strings.my_all? /\d/).to be_falsy
                      end
                    end

                    describe '#my_none?' do
                      it 'should be true' do
                        expect(array_of_strings.my_none? /\d/).to be_truthy
                      end
                    end

                    describe '#my_any?' do
                      it 'should be false' do
                        expect (array_of_strings.my_any? /\d/).to be_falsy
                      end
                    end
                  end # none of the strings match
                end # one or more strings don't match
              end # is made of strings

              context 'is not made of strings' do
                context 'some elements are strings, but not all' do
                  context 'all the strings match' do
                    describe '#my_all?' do
                      it 'should return false' do
                        expect(array.my_all? /o/).to be_falsy
                      end
                    end

                    describe '#my_none?' do
                      it 'should return false' do
                        expect(array.my_none? /o/).to be_falsy
                      end
                    end

                    describe '#my_any?' do
                      it 'should return true' do
                        expect(array.my_any? /o/).to be_truthy
                      end
                    end
                  end # all the strings match

                  context 'some strings match' do
                    describe '#my_all?' do
                      it 'should return false' do
                        expect(array.my_all? /w/).to be_falsy
                      end
                    end

                    describe '#my_none?' do
                      it 'should be false' do
                        expect(array.my_none? /w/).to be_falsy
                      end
                    end

                    describe '#my_any?' do
                      it 'should return true' do
                        expect(array.my_any? /w/).to be_truthy
                      end
                    end
                  end # some strings match

                  context 'none of the strings match' do
                    describe '#my_all?' do
                      it 'should return false' do
                        expect(array.my_all? /\W/).to be_falsy
                      end
                    end

                    describe '#my_none?' do
                      it 'should be true' do
                        expect(array.my_none? /\W/).to be_truthy
                      end
                    end

                    describe '#my_any?' do
                      it 'should be false' do
                        expect(array.my_any? /\W/).to be_falsy
                      end
                    end
                  end # none of the strings match
                end # some elements are strings, but not all

                context 'none of the elements is a string' do
                  describe '#my_all?' do
                    it 'should return false' do
                      expect(array_of_numbers.my_all? /./).to be_falsy
                    end
                  end

                  describe '#my_none?' do
                    it 'should return true' do
                      expect(array_of_number.my_none? /\a/).to be_truthy
                    end
                  end

                  describe '#my_any?' do
                    it 'should return false' do
                      expect(array_of_number.my_any? /\a\s/).to be_falsy
                    end
                  end
                end # none of the elements is a string
              end # is not made of strings
            end # nonempty

            context 'empty' do
              it 'should always return true' do
                expect([].my_all? /./).to be_truthy
                expect([].my_all? /\d\w\s[a-z0-9]/).to be_truthy
              end
            end # empty
          end # array

          context 'hash or range' do
            context 'nonempty' do
              describe '#my_all?' do
                it 'should return false' do
                  expect(hash.my_all? /./).to be_falsy
                  expect(range.my_all? /\d+/).to be_falsy
                end
              end

              describe '#my_none?' do
                it 'should return true' do
                  expect(hash.my_none? /\a\s/).to be_truthy
                  expect(range.my_none? /\s\t/).to be_truthy
                end
              end

              describe '#my_any?' do
                it 'should return false' do
                  expect(hash.my_any? /\a\d/).to be_falsy
                  expect(range.my_any? /\a\.$/).to be_falsy
                end
              end
            end # nonempty

            context 'empty' do
              describe '#my_all?' do
                it 'should return true' do
                  expect({}.my_all?(/\d*[abc][A-Z]/)).to be_truthy
                  expect((0..-1).my_all?(/\w\S\t.\.\-/)).to be_truthy
                end
              end

              describe '#my_none?' do
                it 'should return true' do
                  expect({}.my_none? /\w/).to be_truthy
                  expect((0..-1).my_none? /.\w+$/).to be_truthy
                end
              end

              describe '#my_any?' do
                it 'should return false' do
                  expect({}.my_any? /\a/).to be_falsy
                  expect((0..-1).my_any? /\d\w\.[a-z]/).to be_falsy
                end
              end
            end # empty
          end # hash or range
        end # regular expression

        context 'class' do
          context 'array' do
            context 'nonempty' do
              context 'all the elements are of the same class' do
                describe '#my_all?' do
                  it 'should return true' do
                    expect(array_of_number.my_all? Integer).to be_truthy
                  end
                end

                describe '#my_none?' do
                  it 'should return false' do
                    expect(array_of_number.my_none? Integer).to be_falsy
                  end
                end

                describe '#my_any?' do
                  it 'should return true' do
                    expect(array_of_number.my_any? Integer).to be_truthy
                  end
                end
              end # all the elements are of the same class

              context 'one or more elements are not of the same class' do
                context 'all elements are not of the same class' do
                  describe '#my_all?' do
                    it 'should return false' do
                      expect(array.my_all? Proc).to be_falsy
                    end
                  end

                  describe '#my_none?' do
                    it 'should return true' do
                      expect(array.my_none? Proc).to be_truthy
                    end
                  end

                  describe '#my_any?' do
                    it 'should return false' do
                      expect(array.my_any? Proc).to be_falsy
                    end
                  end
                end # all elements are not of the same class

                context 'some elements are not of the same class, but not all' do
                  describe '#my_all?' do
                    it 'should return false' do
                      expect(array.my_all? String).to be_falsy
                    end
                  end

                  describe '#my_none?' do
                    it 'should return false' do
                      expect(array.my_none? String).to be_falsy
                    end
                  end

                  describe '#my_any?' do
                    it 'should return true' do
                      expect(array.my_any? String).to be_truthy
                    end
                  end
                end # some elements are not of the same class, but not all
              end # one or more elements are not of the same class
            end # nonempty

            context 'empty' do
              describe '#my_all?' do
                it 'should return true' do
                  expect([].my_all?(Integer)).to be_truthy
                end
              end

              describe '#my_none?' do
                it 'should return true' do
                  expect([].my_none?(Integer)).to be_truthy
                end
              end

              describe '#my_any?' do
                it 'should return true' do
                  expect([].my_any?(Integer)).to_not be_truthy
                end
              end
            end # empty
          end # array

          context 'range' do
            context 'nonemty' do
              context 'the class is Integer, Numeric, Object, or BasicObject' do
                describe '#my_all?' do
                  it 'should return true' do
                    expect(range.my_all?(Integer)).to be_truthy
                    expect(range.my_all?(Numeric)).to be_truthy
                    expect(range.my_all?(Object)).to be_truthy
                    expect(range.my_all?(BasicObject)).to be_truthy
                  end
                end

                describe '#my_none?' do
                  it 'should return false' do
                    expect(range.my_none? Integer).to be_falsy
                    expect(range.my_none? Numeric).to be_falsy
                    expect(range.my_none? Object).to be_falsy
                    expect(range.my_none? BasicObject).to be_falsy
                  end
                end

                describe '#my_any?' do
                  it 'returns true' do
                    expect(range.my_any? Integer).to be_truthy
                    expect(range.my_any? Numeric).to be_truthy
                    expect(range.my_any? Object).to be_truthy
                    expect(range.my_any? BasicObject).to be_truthy
                  end
                end
              end # the class is Integer, Numeric, Object, or BasicObject

              context 'the class is neither Integer, Numeric, Object, nor BasicObject' do
                describe '#my_all?' do
                  it 'should return false' do
                    expect(range.my_all?(String)).to_not be_truthy
                  end
                end

                describe '#my_none?' do
                  it 'should return true' do
                    expect(range.my_none? String).to be_truthy
                  end
                end

                describe '#my_any?' do
                  it 'should return false' do
                    expect(range.my_any? String).to be_falsy
                  end
                end
              end # the class is neither Integer, Numeric, Object, nor BasicObject
            end # nonempty

            context 'empty' do
              describe '#my_all?' do
                it 'should return true' do
                  expect((0..-1).my_all?(Integer)).to be_truthy
                end
              end

              describe '#my_none?' do
                it 'should return true' do
                  expect((0..-1).my_none? Proc).to be_truthy
                end
              end

              describe '#my_any?' do
                it 'should return false' do
                  expect((0..-1).my_any? Hash).to be_falsy
                end
              end
            end # empty
          end # range

          context 'hash' do
            context 'nonempty' do
              context 'the class is Array, Object, or BasicObject' do
                describe '#my_all?' do
                  it 'should return true' do
                    expect(hash.my_all? Array).to be_truthy
                    expect(hash.my_all? Object).to be_truthy
                    expect(hash.my_all? BasicObject).to be_truthy
                  end
                end

                describe '#my_none?' do
                  it 'should return false' do
                    expect(hash.my_none? Array).to be_falsy
                    expect(hash.my_none? Object).to be_falsy
                    expect(hash.my_none? BasicObject).to be_falsy
                  end
                end

                describe '#my_any?' do
                  it 'should return true' do
                    expect(hash.my_any? Array).to be_truthy
                    expect(hash.my_any? Object).to be_truthy
                    expect(hash.my_any? BasicObject).to be_truthy
                  end
                end
              end # the class is Array, Object, or BasicObject

              context 'the class is neither Array, Object, nor BasicObject' do
                describe '#my_all?' do
                  it 'should return false' do
                    expect(hash.my_all? String).to be_falsy
                  end
                end

                describe '#my_none?' do
                  it 'should return true' do
                    expect(hash.my_none? Float).to be_truthy
                  end
                end

                describe '#my_any?' do
                  it 'should return false' do
                    expect(hash.my_any? Symbol).to be_falsy
                  end
                end
              end # the class is neither Array, Object, nor BasicObject
            end # nonempty

            context 'empty' do
              describe '#my_all?' do
                it 'should return true' do
                  expect({}.my_all? Method).to be_truthy
                end
              end

              describe '#my_none?' do
                it 'should return true' do
                  expect({}.my_none? Integer).to be_truthy
                end
              end

              describe '#my_any?' do
                it 'should return false' do
                  expect({}.my_any? Range).to be_falsy
                end
              end
            end # empty
          end # hash
        end # class
      end # 1 argument

      context 'more than 1 argument' do
        describe '#my_all?' do
          it 'should raise ArgumentError' do
            expect { array.my_all? Integer, /./ }.to raise_error(ArgumentError)
            expect { hash.my_all? Integer, /./ }.to raise_error(ArgumentError)
            expect { range.my_all? Integer, /./ }.to raise_error(ArgumentError)
          end
        end

        describe '#my_none?' do
          it 'should raise ArgumentError' do
            expect { array.my_none? String, /\S*/ }.to raise_error(ArgumentError)
            expect { hash.my_none? String, /\S*/ }.to raise_error(ArgumentError)
            expect { range.my_none? String, /\S*/ }.to raise_error(ArgumentError)
          end
        end

        describe '#my_any?' do
          it 'should raise ArgumentError' do
            expect { array.my_any? Symbol, /\w+\d*[A-Z]?/ }.to raise_error(ArgumentError)
            expect { hash.my_any? Symbol, /\w+\d*[A-Z]?/ }.to raise_error(ArgumentError)
            expect { range.my_any? Symbol, /\w+\d*[A-Z]?/ }.to raise_error(ArgumentError)
          end
        end
      end # more than 1 argument
    end # with arguments

    context 'without arguments' do
      context 'array' do
        context 'empty' do
          describe '#my_all?' do
            it 'return true ' do
              expect([].my_all?).to be_truthy
            end
          end

          describe '#my_any?' do
            it 'return false' do
              expect([].my_any?).to_not be_truthy
            end
          end

          describe '#my_none?' do
            it 'return true ' do
              expect([].my_none?).to be_truthy
            end
          end
        end # empty

        context 'nonempty' do
          context 'some of the elements evaluates to false' do
            describe '#my_all?' do
              it 'should return false' do
                expect(array_with_one_nil.my_all?).to be_falsy
              end
            end

            describe '#my_none?' do
              it 'should return false' do
                expect(array_with_one_nil.my_none?).to be_falsy
              end
            end

            describe '#my_any?' do
              it 'should return true' do
                expect(array_with_one_nil.my_any?).to be_truthy
              end
            end
          end # some of the elements evaluates to false

          context 'all of the elements evaluates to false' do
            describe '#my_all?' do
              it 'should return false' do
                expect(array_of_nils.my_all?).to be_falsy
              end
            end

            describe '#my_none?' do
              it 'should return true' do
                expect(array_of_nils.my_none?).to be_truthy
              end
            end

            describe '#my_any?' do
              it 'should return false' do
                expect(array_of_nils.my_any?).to be_falsy
              end
            end
          end # all of the elements evaluates to false

          context 'none of the elements evaluates to false' do
            describe '#my_all?' do
              it 'should return true' do
                expect(array.my_all?).to be_truthy
              end
            end

            describe '#my_none?' do
              it 'should return false' do
                expect(array.my_none?).to be_falsy
              end
            end

            describe '#my_any?' do
              it 'should return true' do
                expect(array.my_any?).to be_truthy
              end
            end
          end # none of the elements evaluates to false
        end # nonempty
      end # array

      context 'hash or range' do
        context 'empty' do
          describe '#my_all?' do
            it 'return true' do
              expect({}.my_all?).to be_truthy
              expect((0..-1).my_all?).to be_truthy
            end
          end

          describe '#my_any?' do
            it 'return false' do
              expect({}.my_any?).to_not be_truthy
              expect((0..-1).my_any?).to_not be_truthy
            end
          end

          describe '#my_none?' do
            it 'return true' do
              expect({}.my_none?).to be_truthy
              expect((0..-1).my_none?).to be_truthy
            end
          end
        end # empty

        context 'nonempty' do
          describe '#my_all?' do
            it 'return true ' do
              expect(hash.my_all?).to be_truthy
            end
          end

          describe '#my_any?' do
            it 'return true ' do
              expect(hash.my_any?).to be_truthy
            end
          end

          describe '#my_none?' do
            it 'return false ' do
              expect(hash.my_none?).to_not be_truthy
            end
          end
        end # nonempty
      end # hash or range
    end # without arguments
  end # without block

  context 'with a block' do
    context 'with arguments'
    context 'without variables' do
      context 'evaluates to true' do
        context 'always' do
          describe '#my_all?' do
            it 'should return true' do
              expect(array.my_all? { true }).to be_truthy
            end
          end

          describe '#my_none?' do
            expect()
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
