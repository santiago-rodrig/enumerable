# frozen_string_literal: true

require_relative '../../enumerable'

describe Enumerable do
  let(:array) { [1, 2, 3, 'dog', 'cow', :symbol, (1..10), { name: 'antonio', job: 'engineer' }] }
  let(:array_of_numbers) { [1, 2, 3, 4, 5] }
  let(:array_of_strings) { %w[dog cat lion] }
  let(:array_of_nils) { [nil, nil, nil] }
  let(:array_with_one_nil) { [1, nil, 3] }
  let(:array_of_0s) { Array.new(87, 0) }
  let(:hash) { { name: 'mohamed', job: 'developer' } }
  let(:hash_of_1_pair) { { name: 'rowmina' } }
  let(:range) { (1..10) }
  let(:range_of_1_number) { (1...2) }

  context 'without a block' do
    context 'no arguments' do
      context 'array' do
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
        context 'nonempty' do
          describe '#my_all?' do
            it 'should return true' do
              expect(hash.my_all?).to be_truthy
            end
          end

          describe '#my_any?' do
            it 'should return true' do
              expect(hash.my_any?).to be_truthy
            end
          end

          describe '#my_none?' do
            it 'should return false' do
              expect(hash.my_none?).to be_falsy
            end
          end
        end # nonempty
      end # hash or range
    end # no arguments

    context 'with at most 1 argument' do
      context 'array, range, or hash' do
        context 'empty' do
          describe '#my_all?' do
            it 'should return true' do
              # regex
              expect([].my_all? /./).to be_truthy
              expect([].my_all? /\d\w\s[a-z0-9]/).to be_truthy
              expect((0..-1).my_all? /./).to be_truthy
              expect((0..-1).my_all? /\d\w\s[a-z0-9]/).to be_truthy
              expect({}.my_all? /./).to be_truthy
              expect({}.my_all? /\d\w\s[a-z0-9]/).to be_truthy
              # class
              expect([].my_all? String).to be_truthy
              expect([].my_all? Integer).to be_truthy
              expect((0..-1).my_all? Method).to be_truthy
              expect((0..-1).my_all? Proc).to be_truthy
              expect({}.my_all? Class).to be_truthy
              expect({}.my_all? Float).to be_truthy
              # object
              expect([].my_all? 12).to be_truthy
              expect([].my_all? nil).to be_truthy
              expect((0..-1).my_all? false).to be_truthy
              expect((0..-1).my_all? :hey).to be_truthy
              expect({}.my_all? 'dude').to be_truthy
              expect({}.my_all? 3.1415926539).to be_truthy
            end
          end

          describe '#my_none?' do
            it 'should return true' do
              # regex
              expect([].my_none? /./).to be_truthy
              expect([].my_none? /\d\w\s[a-z0-9]/).to be_truthy
              expect((0..-1).my_none? /./).to be_truthy
              expect((0..-1).my_none? /\d\w\s[a-z0-9]/).to be_truthy
              expect({}.my_all? /./).to be_truthy
              expect({}.my_all? /\d\w\s[a-z0-9]/).to be_truthy
              # class
              expect([].my_none? String).to be_truthy
              expect([].my_none? Integer).to be_truthy
              expect((0..-1).my_none? Method).to be_truthy
              expect((0..-1).my_none? Proc).to be_truthy
              expect({}.my_none? Class).to be_truthy
              expect({}.my_none? Float).to be_truthy
              # object
              expect([].my_none? 12).to be_truthy
              expect([].my_none? nil).to be_truthy
              expect((0..-1).my_none? false).to be_truthy
              expect((0..-1).my_none? :hey).to be_truthy
              expect({}.my_none? 'dude').to be_truthy
              expect({}.my_none? 3.1415926539).to be_truthy
            end
          end

          describe '#my_any?' do
            it 'should return true' do
              # regex
              expect([].my_any? /./).to be_falsy
              expect([].my_any? /\d\w\s[a-z0-9]/).to be_falsy
              expect((0..-1).my_any? /./).to be_falsy
              expect((0..-1).my_any? /\d\w\s[a-z0-9]/).to be_falsy
              expect({}.my_any? /./).to be_falsy
              expect({}.my_any? /\d\w\s[a-z0-9]/).to be_falsy
              # class
              expect([].my_any? String).to be_falsy
              expect([].my_any? Integer).to be_falsy
              expect((0..-1).my_any? Method).to be_falsy
              expect((0..-1).my_any? Proc).to be_falsy
              expect({}.my_any? Class).to be_falsy
              expect({}.my_any? Float).to be_falsy
              # object
              expect([].my_any? 12).to be_falsy
              expect([].my_any? nil).to be_falsy
              expect((0..-1).my_any? false).to be_falsy
              expect((0..-1).my_any? :hey).to be_falsy
              expect({}.my_any? 'dude').to be_falsy
              expect({}.my_any? 3.1415926539).to be_falsy
            end
          end
        end
      end
    end # at most 1 argument

    context 'with 1 argument' do
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
                    expect(array_of_strings.my_none? /\w/).to be_falsy
                  end
                end

                describe '#my_any?' do
                  it 'should return true' do
                    expect(array_of_strings.my_any? /\w/).to be_truthy
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
                      expect(array_of_strings.my_any? /\d/).to be_falsy
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
                    expect(array_of_numbers.my_none? /\a/).to be_truthy
                  end
                end

                describe '#my_any?' do
                  it 'should return false' do
                    expect(array_of_numbers.my_any? /\a\s/).to be_falsy
                  end
                end
              end # none of the elements is a string
            end # is not made of strings
          end # nonempty
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
        end # hash or range
      end # regular expression

      context 'class' do
        context 'array' do
          context 'nonempty' do
            context 'all the elements are of the same class' do
              describe '#my_all?' do
                it 'should return true' do
                  expect(array_of_numbers.my_all? Integer).to be_truthy
                end
              end

              describe '#my_none?' do
                it 'should return false' do
                  expect(array_of_numbers.my_none? Integer).to be_falsy
                end
              end

              describe '#my_any?' do
                it 'should return true' do
                  expect(array_of_numbers.my_any? Integer).to be_truthy
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
        end # hash
      end # class

      context 'object' do
        context 'array' do
          context 'all the elements are equal' do
            describe '#my_all?' do
              it 'should return true' do
                expect(array_of_0s.my_all? 0).to be_truthy
              end
            end

            describe '#my_none?' do
              it 'should return false' do
                expect(array_of_0s.my_none? 0).to be_falsy
              end
            end

            describe '#my_any?' do
              it 'should return true' do
                expect(array_of_0s.my_any? 0).to be_truthy
              end
            end
          end

          context 'some of the elements are different' do
            describe '#my_all?' do
              it 'should return false' do
                expect(array.all? 3).to be_falsy
              end
            end

            describe '#my_none?' do
              it 'should return false' do
                expect(array.none? 3).to be_falsy
              end
            end

            describe '#my_any?' do
              it 'should return true' do
                expect(array.my_any? 3).to be_truthy
              end
            end
          end

          context 'all the elements are different' do
            describe '#my_all?' do
              it 'should return false' do
                expect(array.my_all? 45675.3691282376).to be_falsy
              end
            end

            describe '#my_none?' do
              it 'should return true' do
                expect(array.my_none? 45675.3691282376).to be_truthy
              end
            end

            describe '#my_any?' do
              it 'should return false' do
                expect(array.my_any? 45675.3691282376).to be_falsy
              end
            end
          end
        end

        context 'range' do
          context 'the range consists of only 1 number' do
            context 'the number is equal' do
              describe '#my_all?' do
                it 'should return true' do
                  expect(range_of_1_number.my_all? 1).to be_truthy
                end
              end

              describe '#my_none?' do
                it 'should return false' do
                  expect(range_of_1_number.my_none? 1).to be_falsy
                end
              end

              describe '#my_any?' do
                it 'should return true' do
                  expect(range_of_1_number.my_any? 1).to be_truthy
                end
              end
            end

            context 'the number is different' do
              describe '#my_all?' do
                it 'should return false' do
                  expect(range_of_1_number.my_all? 2).to be_falsy
                end
              end

              describe '#my_none?' do
                it 'should return true' do
                  expect(range_of_1_number.my_none? 2).to be_truthy
                end
              end

              describe '#my_any?' do
                it 'should return false' do
                  expect(range_of_1_number.my_any? 2).to be_falsy
                end
              end
            end
          end

          context 'the range has more than 1 number' do
            context 'all numbers are different' do
              describe '#my_all?' do
                it 'should return false' do
                  expect(range.my_all? 11).to be_falsy
                end
              end

              describe '#my_none?' do
                it 'should return true' do
                  expect(range.my_none? 11).to be_truthy
                end
              end

              describe '#my_any?' do
                it 'should return false' do
                  expect(range.my_any? 11).to be_falsy
                end
              end
            end

            context 'some of the numbers are different' do
              describe '#my_all?' do
                it 'should return false' do
                  expect(range.my_all? 5).to be_falsy
                end
              end

              describe '#my_none?' do
                it 'should return false' do
                  expect(range.my_none? 5).to be_falsy
                end
              end

              describe '#my_any?' do
                it 'should return true' do
                  expect(range.my_any? 5).to be_truthy
                end
              end
            end
          end
        end

        context 'hash' do
          context 'the hash only contains 1 key-value pair' do
            context 'the key-value pair is equal' do
              describe '#my_all?' do
                it 'should return true' do
                  expect(hash_of_1_pair.my_all? [:name, 'rowmina']).to be_truthy
                end
              end

              describe '#my_none?' do
                it 'should return false' do
                  expect(hash_of_1_pair.my_none? [:name, 'rowmina']).to be_falsy
                end
              end

              describe '#my_any?' do
                it 'should return true' do
                  expect(hash_of_1_pair.my_any? [:name, 'rowmina']).to be_truthy
                end
              end
            end

            context 'the key-value pair is different' do
              describe '#my_all?' do
                it 'should return false' do
                  expect(hash_of_1_pair.my_all? [:job, 'journalist']).to be_falsy
                end
              end

              describe '#my_none?' do
                it 'should return true' do
                  expect(hash_of_1_pair.my_none? [:job, 'journalist']).to be_truthy
                end
              end

              describe '#my_any?' do
                it 'should return false' do
                  expect(hash_of_1_pair.my_any? [:job, 'journalist']).to be_falsy
                end
              end
            end
          end

          context 'the hash has more than 1 key-value pair' do
            context 'one of the key-value pairs is equal' do
              describe '#my_all?' do
                it 'should return false' do
                  expect(hash.my_all? [:name, 'mohamed']).to be_falsy
                end
              end

              describe '#my_none?' do
                it 'should return false' do
                  expect(hash.my_none? [:name, 'mohamed']).to be_falsy
                end
              end

              describe '#my_any?' do
                it 'should return true' do
                  expect(hash.my_any? [:name, 'mohamed']).to be_truthy
                end
              end
            end

            context 'all the key-value pairs are different' do
              describe '#my_all?' do
                it 'should return false' do
                  expect(hash.my_all? [:hobby, 'dancing']).to be_falsy
                end
              end

              describe '#my_none?' do
                it 'should return true' do
                  expect(hash.my_none? [:hobby, 'dancing']).to be_truthy
                end
              end

              describe '#my_any?' do
                it 'should return false' do
                  expect(hash.my_any? [:hobby, 'dancing']).to be_falsy
                end
              end
            end
          end
        end
      end
    end # with 1 argument

    context 'more than 1 argument' do
      context 'array, range, or hash' do
        context 'nonempty' do
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
        end
      end
    end # more than 1 argument
  end # without a block
end
