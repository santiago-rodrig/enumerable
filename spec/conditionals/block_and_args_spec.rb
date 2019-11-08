# frozen_string_literal: true

require_relative '../../enumerable'

describe Enumerable do
  let(:array) { [1, 2, 3, 'dog', 'cow', :symbol, (1..10), { name: 'antonio', job: 'engineer' }] }
  let(:array_of_numbers) { [1, 2, 3, 4, 5] }
  let(:array_of_strings) { %w[dog cat lion] }
  let(:array_of_nils) { [nil, nil, nil] }
  let(:array_with_one_nil) { [1, nil, 3] }
  let(:hash) { { name: 'mohamed', job: 'developer' } }
  let(:range) { (1..10) }

  context 'with block and args' do
    context 'block with any number of variables' do
      context 'with at most 1 argument' do
        context 'array, range, or hash' do
          context 'empty' do
            describe '#my_all?' do
              it 'should return true' do
                # regex, empty array
                expect([].my_all?(/./) { false }).to be_truthy
                expect([].my_all?(/./) { |foo| foo }).to be_truthy
                expect([].my_all?(/./) { |foo, bar| bar }).to be_truthy
                expect([].my_all?(/./) { |foo, bar, baz| baz }).to be_truthy
                expect([].my_all?(/\d\w\s[a-z0-9]/) { false }).to be_truthy
                expect([].my_all?(/\d\w\s[a-z0-9]/) { |foo| foo }).to be_truthy
                expect([].my_all?(/\d\w\s[a-z0-9]/) { |foo, bar| bar }).to be_truthy
                expect([].my_all?(/\d\w\s[a-z0-9]/) { |foo, bar, baz| baz }).to be_truthy
                # regex, empty range
                expect((0..-1).my_all?(/./) { false }).to be_truthy
                expect((0..-1).my_all?(/./) { |foo| foo }).to be_truthy
                expect((0..-1).my_all?(/./) { |foo, bar| bar }).to be_truthy
                expect((0..-1).my_all?(/./) { |foo, bar, baz| baz }).to be_truthy
                expect((0..-1).my_all?(/\d\w\s[a-z0-9]/) { false }).to be_truthy
                expect((0..-1).my_all?(/\d\w\s[a-z0-9]/) { |foo| foo }).to be_truthy
                expect((0..-1).my_all?(/\d\w\s[a-z0-9]/) { |foo, bar| bar }).to be_truthy
                expect((0..-1).my_all?(/\d\w\s[a-z0-9]/) { |foo, bar, baz| baz }).to be_truthy
                # regex, empty hash
                expect({}.my_all?(/./) { false }).to be_truthy
                expect({}.my_all?(/./) { |foo| foo }).to be_truthy
                expect({}.my_all?(/./) { |foo, bar| bar }).to be_truthy
                expect({}.my_all?(/./) { |foo, bar, baz| baz }).to be_truthy
                expect({}.my_all?(/\d\w\s[a-z0-9]/) { false }).to be_truthy
                expect({}.my_all?(/\d\w\s[a-z0-9]/) { |foo| foo }).to be_truthy
                expect({}.my_all?(/\d\w\s[a-z0-9]/) { |foo, bar| bar }).to be_truthy
                expect({}.my_all?(/\d\w\s[a-z0-9]/) { |foo, bar, baz| baz }).to be_truthy
                # class, empty array
                expect([].my_all?(String) { false }).to be_truthy
                expect([].my_all?(String) { |foo| foo }).to be_truthy
                expect([].my_all?(String) { |foo, bar| bar }).to be_truthy
                expect([].my_all?(String) { |foo, bar, baz| baz }).to be_truthy
                expect([].my_all?(Integer) { false }).to be_truthy
                expect([].my_all?(Integer) { |foo| foo }).to be_truthy
                expect([].my_all?(Integer) { |foo, bar| bar }).to be_truthy
                expect([].my_all?(Integer) { |foo, bar, baz| baz }).to be_truthy
                # class, empty range
                expect((0..-1).my_all?(Method) { false }).to be_truthy
                expect((0..-1).my_all?(Method) { |foo| foo }).to be_truthy
                expect((0..-1).my_all?(Method) { |foo, bar| bar }).to be_truthy
                expect((0..-1).my_all?(Method) { |foo, bar, baz| baz }).to be_truthy
                expect((0..-1).my_all?(Proc) { false }).to be_truthy
                expect((0..-1).my_all?(Proc) { |foo| foo }).to be_truthy
                expect((0..-1).my_all?(Proc) { |foo, bar| bar }).to be_truthy
                expect((0..-1).my_all?(Proc) { |foo, bar, baz| baz }).to be_truthy
                # class, empty hash
                expect({}.my_all?(Class) { false }).to be_truthy
                expect({}.my_all?(Class) { |foo| foo }).to be_truthy
                expect({}.my_all?(Class) { |foo, bar| bar }).to be_truthy
                expect({}.my_all?(Class) { |foo, bar, baz| baz }).to be_truthy
                expect({}.my_all?(Float) { false }).to be_truthy
                expect({}.my_all?(Float) { |foo| foo }).to be_truthy
                expect({}.my_all?(Float) { |foo, bar| bar }).to be_truthy
                expect({}.my_all?(Float) { |foo, bar, baz| baz }).to be_truthy
                # object, empty array
                expect([].my_all?(12) { false }).to be_truthy
                expect([].my_all?(12) { |foo| foo }).to be_truthy
                expect([].my_all?(12) { |foo, bar| bar }).to be_truthy
                expect([].my_all?(12) { |foo, bar, baz| baz }).to be_truthy
                expect([].my_all?(nil) { false }).to be_truthy
                expect([].my_all?(nil) { |foo| foo }).to be_truthy
                expect([].my_all?(nil) { |foo, bar| bar }).to be_truthy
                expect([].my_all?(nil) { |foo, bar, baz| baz }).to be_truthy
                # object, empty range
                expect((0..-1).my_all?(false) { false }).to be_truthy
                expect((0..-1).my_all?(false) { |foo| foo }).to be_truthy
                expect((0..-1).my_all?(false) { |foo, bar| bar }).to be_truthy
                expect((0..-1).my_all?(false) { |foo, bar, baz| baz }).to be_truthy
                expect((0..-1).my_all?(:hey) { false }).to be_truthy
                expect((0..-1).my_all?(:hey) { |foo| foo }).to be_truthy
                expect((0..-1).my_all?(:hey) { |foo, bar| bar }).to be_truthy
                expect((0..-1).my_all?(:hey) { |foo, bar, baz| baz }).to be_truthy
                # object, empty hash
                expect({}.my_all?('dude') { false }).to be_truthy
                expect({}.my_all?('dude') { |foo| foo }).to be_truthy
                expect({}.my_all?('dude') { |foo, bar| bar }).to be_truthy
                expect({}.my_all?('dude') { |foo, bar, baz| baz }).to be_truthy
                expect({}.my_all?(3.1415926539) { false }).to be_truthy
                expect({}.my_all?(3.1415926539) { |foo| foo }).to be_truthy
                expect({}.my_all?(3.1415926539) { |foo, bar| bar }).to be_truthy
                expect({}.my_all?(3.1415926539) { |foo, bar, baz| baz }).to be_truthy
              end
            end

            describe '#my_none?' do
              it 'should return true' do
                # regex, empty array
                expect([].my_none?(/./) { true }).to be_truthy
                expect([].my_none?(/./) { |foo| !foo }).to be_truthy
                expect([].my_none?(/./) { |foo, bar| !bar }).to be_truthy
                expect([].my_none?(/./) { |foo, bar, baz| !baz }).to be_truthy
                expect([].my_none?(/\d\w\s[a-z0-9]/) { true }).to be_truthy
                expect([].my_none?(/\d\w\s[a-z0-9]/) { |foo| !foo }).to be_truthy
                expect([].my_none?(/\d\w\s[a-z0-9]/) { |foo, bar| !bar }).to be_truthy
                expect([].my_none?(/\d\w\s[a-z0-9]/) { |foo, bar, baz| !baz }).to be_truthy
                # regex, empty range
                expect((0..-1).my_none?(/./) { true }).to be_truthy
                expect((0..-1).my_none?(/./) { |foo| !foo }).to be_truthy
                expect((0..-1).my_none?(/./) { |foo, bar| !bar }).to be_truthy
                expect((0..-1).my_none?(/./) { |foo, bar, baz| !baz }).to be_truthy
                expect((0..-1).my_none?(/\d\w\s[a-z0-9]/) { true }).to be_truthy
                expect((0..-1).my_none?(/\d\w\s[a-z0-9]/) { |foo| !foo }).to be_truthy
                expect((0..-1).my_none?(/\d\w\s[a-z0-9]/) { |foo, bar| !bar }).to be_truthy
                expect((0..-1).my_none?(/\d\w\s[a-z0-9]/) { |foo, bar, baz| !baz }).to be_truthy
                # regex, empty hash
                expect({}.my_none?(/./) { true }).to be_truthy
                expect({}.my_none?(/./) { |foo| !foo }).to be_truthy
                expect({}.my_none?(/./) { |foo, bar| !bar }).to be_truthy
                expect({}.my_none?(/./) { |foo, bar, baz| !baz }).to be_truthy
                expect({}.my_none?(/\d\w\s[a-z0-9]/) { true }).to be_truthy
                expect({}.my_none?(/\d\w\s[a-z0-9]/) { |foo| !foo }).to be_truthy
                expect({}.my_none?(/\d\w\s[a-z0-9]/) { |foo, bar| !bar }).to be_truthy
                expect({}.my_none?(/\d\w\s[a-z0-9]/) { |foo, bar, baz| !baz }).to be_truthy
                # class, empty array
                expect([].my_none?(String) { true }).to be_truthy
                expect([].my_none?(String) { |foo| !foo }).to be_truthy
                expect([].my_none?(String) { |foo, bar| !bar }).to be_truthy
                expect([].my_none?(String) { |foo, bar, baz| !baz }).to be_truthy
                expect([].my_none?(Integer) { true }).to be_truthy
                expect([].my_none?(Integer) { |foo| !foo }).to be_truthy
                expect([].my_none?(Integer) { |foo, bar| !bar }).to be_truthy
                expect([].my_none?(Integer) { |foo, bar, baz| !baz }).to be_truthy
                # class, empty range
                expect((0..-1).my_none?(Method) { true }).to be_truthy
                expect((0..-1).my_none?(Method) { |foo| !foo }).to be_truthy
                expect((0..-1).my_none?(Method) { |foo, bar| !bar }).to be_truthy
                expect((0..-1).my_none?(Method) { |foo, bar, baz| !baz }).to be_truthy
                expect((0..-1).my_none?(Proc) { true }).to be_truthy
                expect((0..-1).my_none?(Proc) { |foo| !foo }).to be_truthy
                expect((0..-1).my_none?(Proc) { |foo, bar| !bar }).to be_truthy
                expect((0..-1).my_none?(Proc) { |foo, bar, baz| !baz }).to be_truthy
                # class, empty hash
                expect({}.my_none?(Class) { true }).to be_truthy
                expect({}.my_none?(Class) { |foo| !foo }).to be_truthy
                expect({}.my_none?(Class) { |foo, bar| !bar }).to be_truthy
                expect({}.my_none?(Class) { |foo, bar, baz| !baz }).to be_truthy
                expect({}.my_none?(Float) { true }).to be_truthy
                expect({}.my_none?(Float) { |foo| !foo }).to be_truthy
                expect({}.my_none?(Float) { |foo, bar| !bar }).to be_truthy
                expect({}.my_none?(Float) { |foo, bar, baz| !baz }).to be_truthy
                # object, empty array
                expect([].my_none?(12) { true }).to be_truthy
                expect([].my_none?(12) { |foo| !foo }).to be_truthy
                expect([].my_none?(12) { |foo, bar| !bar }).to be_truthy
                expect([].my_none?(12) { |foo, bar, baz| !baz }).to be_truthy
                expect([].my_none?(nil) { true }).to be_truthy
                expect([].my_none?(nil) { |foo| !foo }).to be_truthy
                expect([].my_none?(nil) { |foo, bar| !bar }).to be_truthy
                expect([].my_none?(nil) { |foo, bar, baz| !baz }).to be_truthy
                # object, empty range
                expect((0..-1).my_none?(false) { true }).to be_truthy
                expect((0..-1).my_none?(false) { |foo| !foo }).to be_truthy
                expect((0..-1).my_none?(false) { |foo, bar| !bar }).to be_truthy
                expect((0..-1).my_none?(false) { |foo, bar, baz| !baz }).to be_truthy
                expect((0..-1).my_none?(:hey) { true }).to be_truthy
                expect((0..-1).my_none?(:hey) { |foo| !foo }).to be_truthy
                expect((0..-1).my_none?(:hey) { |foo, bar| !bar }).to be_truthy
                expect((0..-1).my_none?(:hey) { |foo, bar, baz| !baz }).to be_truthy
                # object, empty hash
                expect({}.my_none?('dude') { true }).to be_truthy
                expect({}.my_none?('dude') { |foo| !foo }).to be_truthy
                expect({}.my_none?('dude') { |foo, bar| !bar }).to be_truthy
                expect({}.my_none?('dude') { |foo, bar, baz| !baz }).to be_truthy
                expect({}.my_none?(3.1415926539) { true }).to be_truthy
                expect({}.my_none?(3.1415926539) { |foo| !foo }).to be_truthy
                expect({}.my_none?(3.1415926539) { |foo, bar| !bar }).to be_truthy
                expect({}.my_none?(3.1415926539) { |foo, bar, baz| !baz }).to be_truthy
              end
            end

            describe '#my_any?' do
              it 'should return true' do
                # regex, empty array
                expect([].my_any?(/./) { false }).to be_truthy
                expect([].my_any?(/./) { |foo| foo }).to be_truthy
                expect([].my_any?(/./) { |foo, bar| bar }).to be_truthy
                expect([].my_any?(/./) { |foo, bar, baz| baz }).to be_truthy
                expect([].my_any?(/\d\w\s[a-z0-9]/) { false }).to be_truthy
                expect([].my_any?(/\d\w\s[a-z0-9]/) { |foo| foo }).to be_truthy
                expect([].my_any?(/\d\w\s[a-z0-9]/) { |foo, bar| bar }).to be_truthy
                expect([].my_any?(/\d\w\s[a-z0-9]/) { |foo, bar, baz| baz }).to be_truthy
                # regex, empty range
                expect((0..-1).my_any?(/./) { false }).to be_truthy
                expect((0..-1).my_any?(/./) { |foo| foo }).to be_truthy
                expect((0..-1).my_any?(/./) { |foo, bar| bar }).to be_truthy
                expect((0..-1).my_any?(/./) { |foo, bar, baz| baz }).to be_truthy
                expect((0..-1).my_any?(/\d\w\s[a-z0-9]/) { false }).to be_truthy
                expect((0..-1).my_any?(/\d\w\s[a-z0-9]/) { |foo| foo }).to be_truthy
                expect((0..-1).my_any?(/\d\w\s[a-z0-9]/) { |foo, bar| bar }).to be_truthy
                expect((0..-1).my_any?(/\d\w\s[a-z0-9]/) { |foo, bar, baz| baz }).to be_truthy
                # regex, empty hash
                expect({}.my_any?(/./) { false }).to be_truthy
                expect({}.my_any?(/./) { |foo| foo }).to be_truthy
                expect({}.my_any?(/./) { |foo, bar| bar }).to be_truthy
                expect({}.my_any?(/./) { |foo, bar, baz| baz }).to be_truthy
                expect({}.my_any?(/\d\w\s[a-z0-9]/) { false }).to be_truthy
                expect({}.my_any?(/\d\w\s[a-z0-9]/) { |foo| foo }).to be_truthy
                expect({}.my_any?(/\d\w\s[a-z0-9]/) { |foo, bar| bar }).to be_truthy
                expect({}.my_any?(/\d\w\s[a-z0-9]/) { |foo, bar, baz| baz }).to be_truthy
                # class, empty array
                expect([].my_any?(String) { false }).to be_truthy
                expect([].my_any?(String) { |foo| foo }).to be_truthy
                expect([].my_any?(String) { |foo, bar| bar }).to be_truthy
                expect([].my_any?(String) { |foo, bar, baz| baz }).to be_truthy
                expect([].my_any?(Integer) { false }).to be_truthy
                expect([].my_any?(Integer) { |foo| foo }).to be_truthy
                expect([].my_any?(Integer) { |foo, bar| bar }).to be_truthy
                expect([].my_any?(Integer) { |foo, bar, baz| baz }).to be_truthy
                # class, empty range
                expect((0..-1).my_any?(Method) { false }).to be_truthy
                expect((0..-1).my_any?(Method) { |foo| foo }).to be_truthy
                expect((0..-1).my_any?(Method) { |foo, bar| bar }).to be_truthy
                expect((0..-1).my_any?(Method) { |foo, bar, baz| baz }).to be_truthy
                expect((0..-1).my_any?(Proc) { false }).to be_truthy
                expect((0..-1).my_any?(Proc) { |foo| foo }).to be_truthy
                expect((0..-1).my_any?(Proc) { |foo, bar| bar }).to be_truthy
                expect((0..-1).my_any?(Proc) { |foo, bar, baz| baz }).to be_truthy
                # class, empty hash
                expect({}.my_any?(Class) { false }).to be_truthy
                expect({}.my_any?(Class) { |foo| foo }).to be_truthy
                expect({}.my_any?(Class) { |foo, bar| bar }).to be_truthy
                expect({}.my_any?(Class) { |foo, bar, baz| baz }).to be_truthy
                expect({}.my_any?(Float) { false }).to be_truthy
                expect({}.my_any?(Float) { |foo| foo }).to be_truthy
                expect({}.my_any?(Float) { |foo, bar| bar }).to be_truthy
                expect({}.my_any?(Float) { |foo, bar, baz| baz }).to be_truthy
                # object, empty array
                expect([].my_any?(12) { false }).to be_truthy
                expect([].my_any?(12) { |foo| foo }).to be_truthy
                expect([].my_any?(12) { |foo, bar| bar }).to be_truthy
                expect([].my_any?(12) { |foo, bar, baz| baz }).to be_truthy
                expect([].my_any?(nil) { false }).to be_truthy
                expect([].my_any?(nil) { |foo| foo }).to be_truthy
                expect([].my_any?(nil) { |foo, bar| bar }).to be_truthy
                expect([].my_any?(nil) { |foo, bar, baz| baz }).to be_truthy
                # object, empty range
                expect((0..-1).my_any?(false) { false }).to be_truthy
                expect((0..-1).my_any?(false) { |foo| foo }).to be_truthy
                expect((0..-1).my_any?(false) { |foo, bar| bar }).to be_truthy
                expect((0..-1).my_any?(false) { |foo, bar, baz| baz }).to be_truthy
                expect((0..-1).my_any?(:hey) { false }).to be_truthy
                expect((0..-1).my_any?(:hey) { |foo| foo }).to be_truthy
                expect((0..-1).my_any?(:hey) { |foo, bar| bar }).to be_truthy
                expect((0..-1).my_any?(:hey) { |foo, bar, baz| baz }).to be_truthy
                # object, empty hash
                expect({}.my_any?('dude') { false }).to be_truthy
                expect({}.my_any?('dude') { |foo| foo }).to be_truthy
                expect({}.my_any?('dude') { |foo, bar| bar }).to be_truthy
                expect({}.my_any?('dude') { |foo, bar, baz| baz }).to be_truthy
                expect({}.my_any?(3.1415926539) { false }).to be_truthy
                expect({}.my_any?(3.1415926539) { |foo| foo }).to be_truthy
                expect({}.my_any?(3.1415926539) { |foo, bar| bar }).to be_truthy
                expect({}.my_any?(3.1415926539) { |foo, bar, baz| baz }).to be_truthy
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
                      expect(array_of_strings.my_all?(/\w+/) { false })).to be_truthy
                      expect(array_of_strings.my_all?(/\w+/) { |foo| foo })).to be_truthy
                      expect(array_of_strings.my_all?(/\w+/) { |foo, bar| bar })).to be_truthy
                      expect(array_of_strings.my_all?(/\w+/) { |foo, bar, baz| baz })).to be_truthy
                    end
                  end

                  describe '#my_none?' do
                    it 'should return false' do
                      expect(array_of_strings.my_all?(/\w/) { true }).to be_falsy
                      expect(array_of_strings.my_all?(/\w/) { |foo| !foo }).to be_falsy
                      expect(array_of_strings.my_all?(/\w/) { |foo, bar| !bar }).to be_falsy
                      expect(array_of_strings.my_all?(/\w/) { |foo, bar, baz| !baz }).to be_falsy
                    end
                  end

                  describe '#my_any?' do
                    it 'should return true' do
                      expect(array_of_strings.my_all?(/\w/) { false }).to be_truthy
                      expect(array_of_strings.my_all?(/\w/) { |foo| foo }).to be_truthy
                      expect(array_of_strings.my_all?(/\w/) { |foo, bar| bar }).to be_truthy
                      expect(array_of_strings.my_all?(/\w/) { |foo, bar, baz| baz }).to be_truthy
                    end
                  end
                end # all the strings match

                context "one or more strings don't match" do
                  context "some strings don't match, but not all" do
                    describe '#my_all?' do
                      it 'should be false' do
                        expect(array_of_strings.my_all?(/d/) { false }).to be_falsy
                        expect(array_of_strings.my_all?(/d/) { |foo| foo }).to be_falsy
                        expect(array_of_strings.my_all?(/d/) { |foo, bar| bar }).to be_falsy
                        expect(array_of_strings.my_all?(/d/) { |foo, bar, baz| baz }).to be_falsy
                      end
                    end

                    describe '#my_none?' do
                      it 'should be false' do
                        expect(array_of_strings.my_none?(/d/) { true }).to be_falsy
                        expect(array_of_strings.my_none?(/d/) { |foo| !foo }).to be_falsy
                        expect(array_of_strings.my_none?(/d/) { |foo, bar| !bar }).to be_falsy
                        expect(array_of_strings.my_none?(/d/) { |foo, bar, baz| !baz }).to be_falsy
                      end
                    end

                    describe '#my_any?' do
                      it 'should be true' do
                        expect(array_of_strings.my_any?(/d/) { false }).to be_truthy
                        expect(array_of_strings.my_any?(/d/) { |foo| foo }).to be_truthy
                        expect(array_of_strings.my_any?(/d/) { |foo, bar| bar }).to be_truthy
                        expect(array_of_strings.my_any?(/d/) { |foo, bar, baz| baz }).to be_truthy
                      end
                    end
                  end # some strings don't match, but not all

                  context "none of the strings match" do
                    describe '#my_all?' do
                      it 'should be false' do
                        expect(array_of_strings.my_all?(/\d/) { false }).to be_falsy
                        expect(array_of_strings.my_all?(/\d/) { |foo| foo }).to be_falsy
                        expect(array_of_strings.my_all?(/\d/) { |foo, bar| bar }).to be_falsy
                        expect(array_of_strings.my_all?(/\d/) { |foo, bar, baz| baz }).to be_falsy
                      end
                    end

                    describe '#my_none?' do
                      it 'should be true' do
                        expect(array_of_strings.my_none?(/\d/) { true }).to be_truthy
                        expect(array_of_strings.my_none?(/\d/) { |foo| !foo }).to be_truthy
                        expect(array_of_strings.my_none?(/\d/) { |foo, bar| !bar }).to be_truthy
                        expect(array_of_strings.my_none?(/\d/) { |foo, bar, baz| !baz }).to be_truthy
                      end
                    end

                    describe '#my_any?' do
                      it 'should be false' do
                        expect (array_of_strings.my_any?(/\d/) { false }).to be_falsy
                        expect (array_of_strings.my_any?(/\d/) { |foo| foo }).to be_falsy
                        expect (array_of_strings.my_any?(/\d/) { |foo, bar| bar }).to be_falsy
                        expect (array_of_strings.my_any?(/\d/) { |foo, bar, baz| baz }).to be_falsy
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
                        expect(array.my_all?(/o/) { false }).to be_falsy
                        expect(array.my_all?(/o/) { |foo| foo }).to be_falsy
                        expect(array.my_all?(/o/) { |foo, bar| bar }).to be_falsy
                        expect(array.my_all?(/o/) { |foo, bar, baz| baz }).to be_falsy
                      end
                    end

                    describe '#my_none?' do
                      it 'should return false' do
                        expect(array.my_none?(/o/) { true }).to be_falsy
                        expect(array.my_none?(/o/) { |foo| !foo }).to be_falsy
                        expect(array.my_none?(/o/) { |foo, bar| !bar }).to be_falsy
                        expect(array.my_none?(/o/) { |foo, bar, baz| !baz }).to be_falsy
                      end
                    end

                    describe '#my_any?' do
                      it 'should return true' do
                        expect(array.my_any?(/o/) { false }).to be_truthy
                        expect(array.my_any?(/o/) { |foo| foo }).to be_truthy
                        expect(array.my_any?(/o/) { |foo, bar| bar }).to be_truthy
                        expect(array.my_any?(/o/) { |foo, bar, baz| baz }).to be_truthy
                      end
                    end
                  end # all the strings match

                  context 'some strings match' do
                    describe '#my_all?' do
                      it 'should return false' do
                        expect(array.my_all?(/w/) { false }).to be_falsy
                        expect(array.my_all?(/w/) { |foo| foo }).to be_falsy
                        expect(array.my_all?(/w/) { |foo, bar| bar }).to be_falsy
                        expect(array.my_all?(/w/) { |foo, bar, baz| baz }).to be_falsy
                      end
                    end

                    describe '#my_none?' do
                      it 'should be false' do
                        expect(array.my_none?(/w/) { true }).to be_falsy
                        expect(array.my_none?(/w/) { |foo| !foo }).to be_falsy
                        expect(array.my_none?(/w/) { |foo, bar| !bar }).to be_falsy
                        expect(array.my_none?(/w/) { |foo, bar, baz| !baz }).to be_falsy
                      end
                    end

                    describe '#my_any?' do
                      it 'should return true' do
                        expect(array.my_any?(/w/) { false }).to be_truthy
                        expect(array.my_any?(/w/) { |foo| foo }).to be_truthy
                        expect(array.my_any?(/w/) { |foo, bar| bar }).to be_truthy
                        expect(array.my_any?(/w/) { |foo, bar, baz| baz }).to be_truthy
                      end
                    end
                  end # some strings match

                  context 'none of the strings match' do
                    describe '#my_all?' do
                      it 'should return false' do
                        expect(array.my_all?(/\W/) { false }).to be_falsy
                        expect(array.my_all?(/\W/) { |foo| foo }).to be_falsy
                        expect(array.my_all?(/\W/) { |foo, bar| bar }).to be_falsy
                        expect(array.my_all?(/\W/) { |foo, bar, baz| baz }).to be_falsy
                      end
                    end

                    describe '#my_none?' do
                      it 'should be true' do
                        expect(array.my_none?(/\W/) { true }).to be_truthy
                        expect(array.my_none?(/\W/) { |foo| !foo }).to be_truthy
                        expect(array.my_none?(/\W/) { |foo, bar| !bar }).to be_truthy
                        expect(array.my_none?(/\W/) { |foo, bar, baz| !baz }).to be_truthy
                      end
                    end

                    describe '#my_any?' do
                      it 'should be false' do
                        expect(array.my_any?(/\W/) { false }).to be_falsy
                        expect(array.my_any?(/\W/) { |foo| foo }).to be_falsy
                        expect(array.my_any?(/\W/) { |foo, bar| bar }).to be_falsy
                        expect(array.my_any?(/\W/) { |foo, bar, baz| baz }).to be_falsy
                      end
                    end
                  end # none of the strings match
                end # some elements are strings, but not all

                context 'none of the elements is a string' do
                  describe '#my_all?' do
                    it 'should return false' do
                      expect(array_of_numbers.my_all?(/./) { false }).to be_falsy
                      expect(array_of_numbers.my_all?(/./) { |foo| foo }).to be_falsy
                      expect(array_of_numbers.my_all?(/./) { |foo, bar| bar }).to be_falsy
                      expect(array_of_numbers.my_all?(/./) { |foo, bar, baz| baz }).to be_falsy
                    end
                  end

                  describe '#my_none?' do
                    it 'should return true' do
                      expect(array_of_number.my_none?(/\a/) { true }).to be_truthy
                      expect(array_of_number.my_none?(/\a/) { |foo| !foo }).to be_truthy
                      expect(array_of_number.my_none?(/\a/) { |foo, bar| !bar }).to be_truthy
                      expect(array_of_number.my_none?(/\a/) { |foo, bar, baz| !baz }).to be_truthy
                    end
                  end

                  describe '#my_any?' do
                    it 'should return false' do
                      expect(array_of_number.my_any?(/\a\s/) { false }).to be_falsy
                      expect(array_of_number.my_any?(/\a\s/) { |foo| foo }).to be_falsy
                      expect(array_of_number.my_any?(/\a\s/) { |foo, bar| bar }).to be_falsy
                      expect(array_of_number.my_any?(/\a\s/) { |foo, bar, baz| baz }).to be_falsy
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
                  expect(hash.my_all?(/./) { false }).to be_falsy
                  expect(hash.my_all?(/./) { |foo| foo }).to be_falsy
                  expect(hash.my_all?(/./) { |foo, bar| bar }).to be_falsy
                  expect(hash.my_all?(/./) { |foo, bar, baz| baz }).to be_falsy
                  expect(range.my_all?(/\d+/) { false }).to be_falsy
                  expect(range.my_all?(/\d+/) { |foo| foo }).to be_falsy
                  expect(range.my_all?(/\d+/) { |foo, bar| bar }).to be_falsy
                  expect(range.my_all?(/\d+/) { |foo, bar, baz| baz }).to be_falsy
                end
              end

              describe '#my_none?' do
                it 'should return true' do
                  expect(hash.my_none?(/\a\s/) { true }).to be_truthy
                  expect(hash.my_none?(/\a\s/) { |foo| !foo }).to be_truthy
                  expect(hash.my_none?(/\a\s/) { |foo, bar| !bar }).to be_truthy
                  expect(hash.my_none?(/\a\s/) { |foo, bar, baz| !baz }).to be_truthy
                  expect(range.my_none?(/\s\t/) { true }).to be_truthy
                  expect(range.my_none?(/\s\t/) { |foo| !foo }).to be_truthy
                  expect(range.my_none?(/\s\t/) { |foo, bar| !bar }).to be_truthy
                  expect(range.my_none?(/\s\t/) { |foo, bar, baz| !baz }).to be_truthy
                end
              end

              describe '#my_any?' do
                it 'should return false' do
                  expect(hash.my_any?(/\a\d/) { false }).to be_falsy
                  expect(hash.my_any?(/\a\d/) { |foo| foo }).to be_falsy
                  expect(hash.my_any?(/\a\d/) { |foo, bar| bar }).to be_falsy
                  expect(hash.my_any?(/\a\d/) { |foo, bar, baz| baz }).to be_falsy
                  expect(range.my_any?(/\a\.$/) { false }).to be_falsy
                  expect(range.my_any?(/\a\.$/) { |foo| foo }).to be_falsy
                  expect(range.my_any?(/\a\.$/) { |foo, bar| bar }).to be_falsy
                  expect(range.my_any?(/\a\.$/) { |foo, bar, baz| baz }).to be_falsy
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
                    expect(array_of_number.my_all?(Integer) { false }).to be_truthy
                    expect(array_of_number.my_all?(Integer) { |foo| foo }).to be_truthy
                    expect(array_of_number.my_all?(Integer) { |foo, bar| bar }).to be_truthy
                    expect(array_of_number.my_all?(Integer) { |foo, bar, baz| baz }).to be_truthy
                  end
                end

                describe '#my_none?' do
                  it 'should return false' do
                    expect(array_of_number.my_none?(Integer) { true }).to be_falsy
                    expect(array_of_number.my_none?(Integer) { |foo| !foo }).to be_falsy
                    expect(array_of_number.my_none?(Integer) { |foo, bar| !bar }).to be_falsy
                    expect(array_of_number.my_none?(Integer) { |foo, bar, baz| !baz }).to be_falsy
                  end
                end

                describe '#my_any?' do
                  it 'should return true' do
                    expect(array_of_number.my_any?(Integer) { false }).to be_truthy
                    expect(array_of_number.my_any?(Integer) { |foo| foo }).to be_truthy
                    expect(array_of_number.my_any?(Integer) { |foo, bar| bar }).to be_truthy
                    expect(array_of_number.my_any?(Integer) { |foo, bar, baz| baz }).to be_truthy
                  end
                end
              end # all the elements are of the same class

              context 'one or more elements are not of the same class' do
                context 'all elements are not of the same class' do
                  describe '#my_all?' do
                    it 'should return false' do
                      expect(array.my_all?(Proc) { false }).to be_falsy
                      expect(array.my_all?(Proc) { |foo| foo }).to be_falsy
                      expect(array.my_all?(Proc) { |foo, bar| bar }).to be_falsy
                      expect(array.my_all?(Proc) { |foo, bar, baz| baz }).to be_falsy
                    end
                  end

                  describe '#my_none?' do
                    it 'should return true' do
                      expect(array.my_none?(Proc) { true }).to be_truthy
                      expect(array.my_none?(Proc) { |foo| !foo }).to be_truthy
                      expect(array.my_none?(Proc) { |foo, bar| !bar }).to be_truthy
                      expect(array.my_none?(Proc) { |foo, bar, baz| !baz }).to be_truthy
                    end
                  end

                  describe '#my_any?' do
                    it 'should return false' do
                      expect(array.my_any?(Proc) { false }).to be_falsy
                      expect(array.my_any?(Proc) { |foo| foo }).to be_falsy
                      expect(array.my_any?(Proc) { |foo, bar| bar }).to be_falsy
                      expect(array.my_any?(Proc) { |foo, bar, baz| baz }).to be_falsy
                    end
                  end
                end # all elements are not of the same class

                context 'some elements are not of the same class, but not all' do
                  describe '#my_all?' do
                    it 'should return false' do
                      expect(array.my_all?(String) { false }).to be_falsy
                      expect(array.my_all?(String) { |foo| foo }).to be_falsy
                      expect(array.my_all?(String) { |foo, bar| bar }).to be_falsy
                      expect(array.my_all?(String) { |foo, bar, baz| baz }).to be_falsy
                    end
                  end

                  describe '#my_none?' do
                    it 'should return false' do
                      expect(array.my_none?(String) { true }).to be_falsy
                      expect(array.my_none?(String) { |foo| !foo }).to be_falsy
                      expect(array.my_none?(String) { |foo, bar| !bar }).to be_falsy
                      expect(array.my_none?(String) { |foo, bar, baz| !baz }).to be_falsy
                    end
                  end

                  describe '#my_any?' do
                    it 'should return true' do
                      expect(array.my_any?(String) { false }).to be_truthy
                      expect(array.my_any?(String) { |foo| foo }).to be_truthy
                      expect(array.my_any?(String) { |foo, bar| bar }).to be_truthy
                      expect(array.my_any?(String) { |foo, bar, baz| baz }).to be_truthy
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
                    expect(range.my_all?(Integer) { false }).to be_truthy
                    expect(range.my_all?(Integer) { |foo| foo }).to be_truthy
                    expect(range.my_all?(Integer) { |foo, bar| bar }).to be_truthy
                    expect(range.my_all?(Integer) { |foo, bar, baz| baz }).to be_truthy
                    expect(range.my_all?(Numeric) { false }).to be_truthy
                    expect(range.my_all?(Numeric) { |foo| foo }).to be_truthy
                    expect(range.my_all?(Numeric) { |foo, bar| bar }).to be_truthy
                    expect(range.my_all?(Numeric) { |foo, bar, baz| baz }).to be_truthy
                    expect(range.my_all?(Object) { false }).to be_truthy
                    expect(range.my_all?(Object) { |foo| foo }).to be_truthy
                    expect(range.my_all?(Object) { |foo, bar| bar }).to be_truthy
                    expect(range.my_all?(Object) { |foo, bar, baz| baz }).to be_truthy
                    expect(range.my_all?(BasicObject) { false }).to be_truthy
                    expect(range.my_all?(BasicObject) { |foo| foo }).to be_truthy
                    expect(range.my_all?(BasicObject) { |foo, bar| bar }).to be_truthy
                    expect(range.my_all?(BasicObject) { |foo, bar, baz| baz }).to be_truthy
                  end
                end

                describe '#my_none?' do
                  it 'should return false' do
                    expect(range.my_none?(Integer) { true }).to be_falsy
                    expect(range.my_none?(Integer) { |foo| !foo }).to be_falsy
                    expect(range.my_none?(Integer) { |foo, bar| !bar }).to be_falsy
                    expect(range.my_none?(Integer) { |foo, bar, baz| !baz }).to be_falsy
                    expect(range.my_none?(Numeric) { true }).to be_falsy
                    expect(range.my_none?(Numeric) { |foo| !foo }).to be_falsy
                    expect(range.my_none?(Numeric) { |foo, bar| !bar }).to be_falsy
                    expect(range.my_none?(Numeric) { |foo, bar, baz| !baz }).to be_falsy
                    expect(range.my_none?(Object) { true }).to be_falsy
                    expect(range.my_none?(Object) { |foo| !foo }).to be_falsy
                    expect(range.my_none?(Object) { |foo, bar| !bar }).to be_falsy
                    expect(range.my_none?(Object) { |foo, bar, baz| !baz }).to be_falsy
                    expect(range.my_none?(BasicObject) { true }).to be_falsy
                    expect(range.my_none?(BasicObject) { |foo| !foo }).to be_falsy
                    expect(range.my_none?(BasicObject) { |foo, bar| !bar }).to be_falsy
                    expect(range.my_none?(BasicObject) { |foo, bar, baz| !baz }).to be_falsy
                  end
                end

                describe '#my_any?' do
                  it 'returns true' do
                    expect(range.my_any?(Integer) { false }).to be_truthy
                    expect(range.my_any?(Integer) { |foo| foo }).to be_truthy
                    expect(range.my_any?(Integer) { |foo, bar| bar }).to be_truthy
                    expect(range.my_any?(Integer) { |foo, bar, baz| baz }).to be_truthy
                    expect(range.my_any?(Numeric) { false }).to be_truthy
                    expect(range.my_any?(Numeric) { |foo| foo }).to be_truthy
                    expect(range.my_any?(Numeric) { |foo, bar| bar }).to be_truthy
                    expect(range.my_any?(Numeric) { |foo, bar, baz| baz }).to be_truthy
                    expect(range.my_any?(Object) { false }).to be_truthy
                    expect(range.my_any?(Object) { |foo| foo }).to be_truthy
                    expect(range.my_any?(Object) { |foo, bar| bar }).to be_truthy
                    expect(range.my_any?(Object) { |foo, bar, baz| baz }).to be_truthy
                    expect(range.my_any?(BasicObject) { false }).to be_truthy
                    expect(range.my_any?(BasicObject) { |foo| foo }).to be_truthy
                    expect(range.my_any?(BasicObject) { |foo, bar| bar }).to be_truthy
                    expect(range.my_any?(BasicObject) { |foo, bar, baz| baz }).to be_truthy
                  end
                end
              end # the class is Integer, Numeric, Object, or BasicObject

              context 'the class is neither Integer, Numeric, Object, nor BasicObject' do
                describe '#my_all?' do
                  it 'should return false' do
                    expect(range.my_all?(String) { false })).to_not be_truthy
                    expect(range.my_all?(String) { |foo| foo })).to_not be_truthy
                    expect(range.my_all?(String) { |foo, bar| bar })).to_not be_truthy
                    expect(range.my_all?(String) { |foo, bar, baz| baz })).to_not be_truthy
                  end
                end

                describe '#my_none?' do
                  it 'should return true' do
                    expect(range.my_none?(String) { true }).to be_truthy
                    expect(range.my_none?(String) { |foo| !foo }).to be_truthy
                    expect(range.my_none?(String) { |foo, bar| !bar }).to be_truthy
                    expect(range.my_none?(String) { |foo, bar, baz| !baz }).to be_truthy
                  end
                end

                describe '#my_any?' do
                  it 'should return false' do
                    expect(range.my_any?(String) { false }).to be_falsy
                    expect(range.my_any?(String) { |foo| foo }).to be_falsy
                    expect(range.my_any?(String) { |foo, bar| bar }).to be_falsy
                    expect(range.my_any?(String) { |foo, bar, baz| baz }).to be_falsy
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
                    expect(hash.my_all?(Array) { false }).to be_truthy
                    expect(hash.my_all?(Array) { |foo| foo }).to be_truthy
                    expect(hash.my_all?(Array) { |foo, bar| bar }).to be_truthy
                    expect(hash.my_all?(Array) { |foo, bar, baz| baz }).to be_truthy
                    expect(hash.my_all?(Object) { false }).to be_truthy
                    expect(hash.my_all?(Object) { |foo| foo }).to be_truthy
                    expect(hash.my_all?(Object) { |foo, bar| bar }).to be_truthy
                    expect(hash.my_all?(Object) { |foo, bar, baz| baz }).to be_truthy
                    expect(hash.my_all?(BasicObject) { false }).to be_truthy
                    expect(hash.my_all?(BasicObject) { |foo| foo }).to be_truthy
                    expect(hash.my_all?(BasicObject) { |foo, bar| bar }).to be_truthy
                    expect(hash.my_all?(BasicObject) { |foo, bar, baz| baz }).to be_truthy
                  end
                end

                describe '#my_none?' do
                  it 'should return false' do
                    expect(hash.my_none?(Array) { true }).to be_falsy
                    expect(hash.my_none?(Array) { |foo| !foo }).to be_falsy
                    expect(hash.my_none?(Array) { |foo, bar| !bar }).to be_falsy
                    expect(hash.my_none?(Array) { |foo, bar, baz| !baz }).to be_falsy
                    expect(hash.my_none?(Object) { true }).to be_falsy
                    expect(hash.my_none?(Object) { |foo| !foo }).to be_falsy
                    expect(hash.my_none?(Object) { |foo, bar| !bar }).to be_falsy
                    expect(hash.my_none?(Object) { |foo, bar, baz| !baz }).to be_falsy
                    expect(hash.my_none?(BasicObject) { true }).to be_falsy
                    expect(hash.my_none?(BasicObject) { |foo| !foo }).to be_falsy
                    expect(hash.my_none?(BasicObject) { |foo, bar| !bar }).to be_falsy
                    expect(hash.my_none?(BasicObject) { |foo, bar, baz| !baz }).to be_falsy
                  end
                end

                describe '#my_any?' do
                  it 'should return true' do
                    expect(hash.my_any?(Array) { false }).to be_truthy
                    expect(hash.my_any?(Array) { |foo| foo }).to be_truthy
                    expect(hash.my_any?(Array) { |foo, bar| bar }).to be_truthy
                    expect(hash.my_any?(Array) { |foo, bar, baz| baz }).to be_truthy
                    expect(hash.my_any?(Object) { false }).to be_truthy
                    expect(hash.my_any?(Object) { |foo| foo }).to be_truthy
                    expect(hash.my_any?(Object) { |foo, bar| bar }).to be_truthy
                    expect(hash.my_any?(Object) { |foo, bar, baz| baz }).to be_truthy
                    expect(hash.my_any?(BasicObject) { false }).to be_truthy
                    expect(hash.my_any?(BasicObject) { |foo| foo }).to be_truthy
                    expect(hash.my_any?(BasicObject) { |foo, bar| bar }).to be_truthy
                    expect(hash.my_any?(BasicObject) { |foo, bar, baz| baz }).to be_truthy
                  end
                end
              end # the class is Array, Object, or BasicObject

              context 'the class is neither Array, Object, nor BasicObject' do
                describe '#my_all?' do
                  it 'should return false' do
                    expect(hash.my_all?(String) { false }).to be_falsy
                    expect(hash.my_all?(String) { |foo| foo }).to be_falsy
                    expect(hash.my_all?(String) { |foo, bar| bar }).to be_falsy
                    expect(hash.my_all?(String) { |foo, bar, baz| baz }).to be_falsy
                  end
                end

                describe '#my_none?' do
                  it 'should return true' do
                    expect(hash.my_none?(Float) { true }).to be_truthy
                    expect(hash.my_none?(Float) { |foo| !foo }).to be_truthy
                    expect(hash.my_none?(Float) { |foo, bar| !bar }).to be_truthy
                    expect(hash.my_none?(Float) { |foo, bar, baz| !baz }).to be_truthy
                  end
                end

                describe '#my_any?' do
                  it 'should return false' do
                    expect(hash.my_any?(Symbol) { false }).to be_falsy
                    expect(hash.my_any?(Symbol) { |foo| foo }).to be_falsy
                    expect(hash.my_any?(Symbol) { |foo, bar| bar }).to be_falsy
                    expect(hash.my_any?(Symbol) { |foo, bar, baz| baz }).to be_falsy
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
                  expect(array_of_0s.my_all?(0) { false }).to be_truthy
                  expect(array_of_0s.my_all?(0) { |foo| foo }).to be_truthy
                  expect(array_of_0s.my_all?(0) { |foo, bar| bar }).to be_truthy
                  expect(array_of_0s.my_all?(0) { |foo, bar, baz| baz }).to be_truthy
                end
              end

              describe '#my_none?' do
                it 'should return false' do
                  expect(array_of_0s.my_none?(0) { true }).to be_falsy
                  expect(array_of_0s.my_none?(0) { |foo| !foo }).to be_falsy
                  expect(array_of_0s.my_none?(0) { |foo, bar| !bar }).to be_falsy
                  expect(array_of_0s.my_none?(0) { |foo, bar, baz| !baz }).to be_falsy
                end
              end

              describe '#my_any?' do
                it 'should return true' do
                  expect(array_of_0s.my_any?(0) { false }).to be_truthy
                  expect(array_of_0s.my_any?(0) { |foo| foo }).to be_truthy
                  expect(array_of_0s.my_any?(0) { |foo, bar| bar }).to be_truthy
                  expect(array_of_0s.my_any?(0) { |foo, bar, baz| baz }).to be_truthy
                end
              end
            end

            context 'some of the elements are different' do
              describe '#my_all?' do
                it 'should return false' do
                  expect(array.all?(3) { false }).to be_falsy
                  expect(array.all?(3) { |foo| foo }).to be_falsy
                  expect(array.all?(3) { |foo, bar| bar }).to be_falsy
                  expect(array.all?(3) { |foo, bar, baz| baz }).to be_falsy
                end
              end

              describe '#my_none?' do
                it 'should return false' do
                  expect(array.none?(3) { true }).to be_falsy
                  expect(array.none?(3) { |foo| !foo }).to be_falsy
                  expect(array.none?(3) { |foo, bar| !bar }).to be_falsy
                  expect(array.none?(3) { |foo, bar, baz| !baz }).to be_falsy
                end
              end

              describe '#my_any?' do
                it 'should return true' do
                  expect(aray.my_any?(3) { false }).to be_truthy
                  expect(aray.my_any?(3) { |foo| foo }).to be_truthy
                  expect(aray.my_any?(3) { |foo, bar| bar }).to be_truthy
                  expect(aray.my_any?(3) { |foo, bar, baz| baz }).to be_truthy
                end
              end
            end

            context 'all the elements are different' do
              describe '#my_all?' do
                it 'should return false' do
                  expect(array.my_all?(45675.3691282376) { false }).to be_falsy
                  expect(array.my_all?(45675.3691282376) { |foo| foo }).to be_falsy
                  expect(array.my_all?(45675.3691282376) { |foo, bar| bar }).to be_falsy
                  expect(array.my_all?(45675.3691282376) { |foo, bar, baz| baz }).to be_falsy
                end
              end

              describe '#my_none?' do
                it 'should return true' do
                  expect(array.my_none?(45675.3691282376) { true }).to be_truthy
                  expect(array.my_none?(45675.3691282376) { |foo| !foo }).to be_truthy
                  expect(array.my_none?(45675.3691282376) { |foo, bar| !bar }).to be_truthy
                  expect(array.my_none?(45675.3691282376) { |foo, bar, baz| !baz }).to be_truthy
                end
              end

              describe '#my_any?' do
                it 'should return false' do
                  expect(array.my_any?(45675.3691282376) { false }).to be_falsy
                  expect(array.my_any?(45675.3691282376) { |foo| foo }).to be_falsy
                  expect(array.my_any?(45675.3691282376) { |foo, bar| bar }).to be_falsy
                  expect(array.my_any?(45675.3691282376) { |foo, bar, baz| baz }).to be_falsy
                end
              end
            end
          end

          context 'range' do
            context 'the range consists of only 1 number' do
              context 'the number is equal' do
                describe '#my_all?' do
                  it 'should return true' do
                    expect(range_of_1_number.my_all?(1) { false }).to be_truthy
                    expect(range_of_1_number.my_all?(1) { |foo| foo }).to be_truthy
                    expect(range_of_1_number.my_all?(1) { |foo, bar| bar }).to be_truthy
                    expect(range_of_1_number.my_all?(1) { |foo, bar, baz| baz }).to be_truthy
                  end
                end

                describe '#my_none?' do
                  it 'should return false' do
                    expect(range_of_1_number.my_none?(1) { true }).to be_falsy
                    expect(range_of_1_number.my_none?(1) { |foo| !foo }).to be_falsy
                    expect(range_of_1_number.my_none?(1) { |foo, bar| !bar }).to be_falsy
                    expect(range_of_1_number.my_none?(1) { |foo, bar, baz| !baz }).to be_falsy
                  end
                end

                describe '#my_any?' do
                  it 'should return true' do
                    expect(range_of_1_number.my_any?(1) { false }).to be_truthy
                    expect(range_of_1_number.my_any?(1) { |foo| foo }).to be_truthy
                    expect(range_of_1_number.my_any?(1) { |foo, bar| bar }).to be_truthy
                    expect(range_of_1_number.my_any?(1) { |foo, bar, baz| baz }).to be_truthy
                  end
                end
              end

              context 'the number is different' do
                describe '#my_all?' do
                  it 'should return false' do
                    expect(range_of_1_number.my_all?(2) { false }).to be_falsy
                    expect(range_of_1_number.my_all?(2) { |foo| foo }).to be_falsy
                    expect(range_of_1_number.my_all?(2) { |foo, bar| bar }).to be_falsy
                    expect(range_of_1_number.my_all?(2) { |foo, bar, baz| baz }).to be_falsy
                  end
                end

                describe '#my_none?' do
                  it 'should return true' do
                    expect(range_of_1_number.my_none?(2) { true }).to be_truthy
                    expect(range_of_1_number.my_none?(2) { |foo| !foo }).to be_truthy
                    expect(range_of_1_number.my_none?(2) { |foo, bar| !bar }).to be_truthy
                    expect(range_of_1_number.my_none?(2) { |foo, bar, baz| !baz }).to be_truthy
                  end
                end

                describe '#my_any?' do
                  it 'should return false' do
                    expect(range_of_1_number.my_any?(2) { false }).to be_falsy
                    expect(range_of_1_number.my_any?(2) { |foo| foo }).to be_falsy
                    expect(range_of_1_number.my_any?(2) { |foo, bar| bar }).to be_falsy
                    expect(range_of_1_number.my_any?(2) { |foo, bar, baz| baz }).to be_falsy
                  end
                end
              end
            end

            context 'the range has more than 1 number' do
              context 'all numbers are different' do
                describe '#my_all?' do
                  it 'should return false' do
                    expect(range.my_all?(11) { false }).to be_falsy
                    expect(range.my_all?(11) { |foo| foo }).to be_falsy
                    expect(range.my_all?(11) { |foo, bar| bar }).to be_falsy
                    expect(range.my_all?(11) { |foo, bar, baz| baz }).to be_falsy
                  end
                end

                describe '#my_none?' do
                  it 'should return true' do
                    expect(range.my_none?(11) { true }).to be_truthy
                    expect(range.my_none?(11) { |foo| !foo }).to be_truthy
                    expect(range.my_none?(11) { |foo, bar| !bar }).to be_truthy
                    expect(range.my_none?(11) { |foo, bar, baz| !baz }).to be_truthy
                  end
                end

                describe '#my_any?' do
                  it 'should return false' do
                    expect(range.my_any?(11) { false }).to be_falsy
                    expect(range.my_any?(11) { |foo| foo }).to be_falsy
                    expect(range.my_any?(11) { |foo, bar| bar }).to be_falsy
                    expect(range.my_any?(11) { |foo, bar, baz| baz }).to be_falsy
                  end
                end
              end

              context 'some of the numbers are different' do
                describe '#my_all?' do
                  it 'should return false' do
                    expect(range.my_all?(5) { false }).to be_falsy
                    expect(range.my_all?(5) { |foo| foo }).to be_falsy
                    expect(range.my_all?(5) { |foo, bar| bar }).to be_falsy
                    expect(range.my_all?(5) { |foo, bar, baz| baz }).to be_falsy
                  end
                end

                describe '#my_none?' do
                  it 'should return false' do
                    expect(range.my_none?(5) { true }).to be_falsy
                    expect(range.my_none?(5) { |foo| !foo }).to be_falsy
                    expect(range.my_none?(5) { |foo, bar| !bar }).to be_falsy
                    expect(range.my_none?(5) { |foo, bar, baz| !baz }).to be_falsy
                  end
                end

                describe '#my_any?' do
                  it 'should return true' do
                    expect(range.my_any?(5) { false }).to be_falsy
                    expect(range.my_any?(5) { |foo| foo }).to be_falsy
                    expect(range.my_any?(5) { |foo, bar| bar }).to be_falsy
                    expect(range.my_any?(5) { |foo, bar, baz| baz }).to be_falsy
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
                    expect(hash_of_1_pair.my_all?([:name, 'rowmina']) { false }).to be_truthy
                    expect(hash_of_1_pair.my_all?([:name, 'rowmina']) { |foo| foo }).to be_truthy
                    expect(hash_of_1_pair.my_all?([:name, 'rowmina']) { |foo, bar| bar }).to be_truthy
                    expect(hash_of_1_pair.my_all?([:name, 'rowmina']) { |foo, bar, baz| baz }).to be_truthy
                  end
                end

                describe '#my_none?' do
                  it 'should return false' do
                    expect(hash_of_1_pair.my_none?([:name, 'rowmina']) { true }).to be_falsy
                    expect(hash_of_1_pair.my_none?([:name, 'rowmina']) { |foo| !foo }).to be_falsy
                    expect(hash_of_1_pair.my_none?([:name, 'rowmina']) { |foo, bar| !bar }).to be_falsy
                    expect(hash_of_1_pair.my_none?([:name, 'rowmina']) { |foo, bar, baz| !baz }).to be_falsy
                  end
                end

                describe '#my_any?' do
                  it 'should return true' do
                    expect(hash_of_1_pair.my_any?([:name, 'rowmina']) { false }).to be_truthy
                    expect(hash_of_1_pair.my_any?([:name, 'rowmina']) { |foo| foo }).to be_truthy
                    expect(hash_of_1_pair.my_any?([:name, 'rowmina']) { |foo, bar| bar }).to be_truthy
                    expect(hash_of_1_pair.my_any?([:name, 'rowmina']) { |foo, bar, baz| baz }).to be_truthy
                  end
                end
              end

              context 'the key-value pair is different' do
                describe '#my_all?' do
                  it 'should return false' do
                    expect(hash_of_1_pair.my_all?([:job, 'journalist']) { false }).to be_falsy
                    expect(hash_of_1_pair.my_all?([:job, 'journalist']) { |foo| foo }).to be_falsy
                    expect(hash_of_1_pair.my_all?([:job, 'journalist']) { |foo, bar| bar }).to be_falsy
                    expect(hash_of_1_pair.my_all?([:job, 'journalist']) { |foo, bar, baz| baz }).to be_falsy
                  end
                end

                describe '#my_none?' do
                  it 'should return true' do
                    expect(hash_of_1_pair.my_none?([:job, 'journalist']) { true }).to be_truthy
                    expect(hash_of_1_pair.my_none?([:job, 'journalist']) { |foo| !foo }).to be_truthy
                    expect(hash_of_1_pair.my_none?([:job, 'journalist']) { |foo, bar| !bar }).to be_truthy
                    expect(hash_of_1_pair.my_none?([:job, 'journalist']) { |foo, bar, baz| !baz }).to be_truthy
                  end
                end

                describe '#my_any?' do
                  it 'should return false' do
                    expect(hash_of_1_pair.my_any?([:job, 'journalist']) { false }).to be_falsy
                    expect(hash_of_1_pair.my_any?([:job, 'journalist']) { |foo| foo }).to be_falsy
                    expect(hash_of_1_pair.my_any?([:job, 'journalist']) { |foo, bar| bar }).to be_falsy
                    expect(hash_of_1_pair.my_any?([:job, 'journalist']) { |foo, bar, baz| baz }).to be_falsy
                  end
                end
              end
            end

            context 'the hash has more than 1 key-value pair' do
              context 'one of the key-value pairs is equal' do
                describe '#my_all?' do
                  it 'should return false' do
                    expect(hash.my_all?([:name, 'mohamed']) { false }).to be_falsy
                    expect(hash.my_all?([:name, 'mohamed']) { |foo| foo }).to be_falsy
                    expect(hash.my_all?([:name, 'mohamed']) { |foo, bar| bar }).to be_falsy
                    expect(hash.my_all?([:name, 'mohamed']) { |foo, bar, baz| baz }).to be_falsy
                  end
                end

                describe '#my_none?' do
                  it 'should return false' do
                    expect(hash.my_none?([:name, 'mohamed']) { true }).to be_falsy
                    expect(hash.my_none?([:name, 'mohamed']) { |foo| !foo }).to be_falsy
                    expect(hash.my_none?([:name, 'mohamed']) { |foo, bar| !bar }).to be_falsy
                    expect(hash.my_none?([:name, 'mohamed']) { |foo, bar, baz| !baz }).to be_falsy
                  end
                end

                describe '#my_any?' do
                  it 'should return true' do
                    expect(hash.my_any?([:name, 'mohamed']) { false }).to be_truthy
                    expect(hash.my_any?([:name, 'mohamed']) { |foo| foo }).to be_truthy
                    expect(hash.my_any?([:name, 'mohamed']) { |foo, bar| bar }).to be_truthy
                    expect(hash.my_any?([:name, 'mohamed']) { |foo, bar, baz| baz }).to be_truthy
                  end
                end
              end

              context 'all the key-value pairs are different' do
                describe '#my_all?' do
                  it 'should return false' do
                    expect(hash.my_all?([:hobby, 'dancing']) { false }).to be_falsy
                    expect(hash.my_all?([:hobby, 'dancing']) { |foo| foo }).to be_falsy
                    expect(hash.my_all?([:hobby, 'dancing']) { |foo, bar| bar }).to be_falsy
                    expect(hash.my_all?([:hobby, 'dancing']) { |foo, bar, baz| baz }).to be_falsy
                  end
                end

                describe '#my_none?' do
                  it 'should return true' do
                    expect(hash.my_none?([:hobby, 'dancing']) { true }).to be_truthy
                    expect(hash.my_none?([:hobby, 'dancing']) { |foo| !foo }).to be_truthy
                    expect(hash.my_none?([:hobby, 'dancing']) { |foo, bar| !bar }).to be_truthy
                    expect(hash.my_none?([:hobby, 'dancing']) { |foo, bar, baz| !baz }).to be_truthy
                  end
                end

                describe '#my_any?' do
                  it 'should return false' do
                    expect(hash.my_any?([:hobby, 'dancing']) { false }).to be_falsy
                    expect(hash.my_any?([:hobby, 'dancing']) { |foo| foo }).to be_falsy
                    expect(hash.my_any?([:hobby, 'dancing']) { |foo, bar| bar }).to be_falsy
                    expect(hash.my_any?([:hobby, 'dancing']) { |foo, bar, baz| baz }).to be_falsy
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
                expect { array.my_all?(Integer, /./) { false } }.to raise_error(ArgumentError)
                expect { array.my_all?(Integer, /./) { |foo| foo } }.to raise_error(ArgumentError)
                expect { array.my_all?(Integer, /./) { |foo, bar| bar } }.to raise_error(ArgumentError)
                expect { array.my_all?(Integer, /./) { |foo, bar, baz| baz } }.to raise_error(ArgumentError)
                expect { hash.my_all?(Integer, /./) { false } }.to raise_error(ArgumentError)
                expect { hash.my_all?(Integer, /./) { |foo| foo } }.to raise_error(ArgumentError)
                expect { hash.my_all?(Integer, /./) { |foo, bar| bar } }.to raise_error(ArgumentError)
                expect { hash.my_all?(Integer, /./) { |foo, bar, baz| baz } }.to raise_error(ArgumentError)
                expect { range.my_all?(Integer, /./) { false } }.to raise_error(ArgumentError)
                expect { range.my_all?(Integer, /./) { |foo| foo } }.to raise_error(ArgumentError)
                expect { range.my_all?(Integer, /./) { |foo, bar| bar } }.to raise_error(ArgumentError)
                expect { range.my_all?(Integer, /./) { |foo, bar, baz| baz } }.to raise_error(ArgumentError)
              end
            end

            describe '#my_none?' do
              it 'should raise ArgumentError' do
                expect { array.my_none?(String, /\S*/) { true } }.to raise_error(ArgumentError)
                expect { array.my_none?(String, /\S*/) { |foo| !foo } }.to raise_error(ArgumentError)
                expect { array.my_none?(String, /\S*/) { |foo, bar| !bar } }.to raise_error(ArgumentError)
                expect { array.my_none?(String, /\S*/) { |foo, bar, baz| !baz } }.to raise_error(ArgumentError)
                expect { hash.my_none?(String, /\S*/) { true } }.to raise_error(ArgumentError)
                expect { hash.my_none?(String, /\S*/) { |foo| !foo } }.to raise_error(ArgumentError)
                expect { hash.my_none?(String, /\S*/) { |foo, bar| !bar } }.to raise_error(ArgumentError)
                expect { hash.my_none?(String, /\S*/) { |foo, bar, baz| !baz } }.to raise_error(ArgumentError)
                expect { range.my_none?(String, /\S*/) { true } }.to raise_error(ArgumentError)
                expect { range.my_none?(String, /\S*/) { |foo| !foo } }.to raise_error(ArgumentError)
                expect { range.my_none?(String, /\S*/) { |foo, bar| !bar } }.to raise_error(ArgumentError)
                expect { range.my_none?(String, /\S*/) { |foo, bar, baz| !baz } }.to raise_error(ArgumentError)
              end
            end

            describe '#my_any?' do
              it 'should raise ArgumentError' do
                expect { array.my_any?(Symbol, /\w+\d*[A-Z]?/) { false } }.to raise_error(ArgumentError)
                expect { array.my_any?(Symbol, /\w+\d*[A-Z]?/) { |foo| foo } }.to raise_error(ArgumentError)
                expect { array.my_any?(Symbol, /\w+\d*[A-Z]?/) { |foo, bar| bar } }.to raise_error(ArgumentError)
                expect { array.my_any?(Symbol, /\w+\d*[A-Z]?/) { |foo, bar, baz| baz } }.to raise_error(ArgumentError)
                expect { hash.my_any?(Symbol, /\w+\d*[A-Z]?/) { false } }.to raise_error(ArgumentError)
                expect { hash.my_any?(Symbol, /\w+\d*[A-Z]?/) { |foo| foo } }.to raise_error(ArgumentError)
                expect { hash.my_any?(Symbol, /\w+\d*[A-Z]?/) { |foo, bar| bar } }.to raise_error(ArgumentError)
                expect { hash.my_any?(Symbol, /\w+\d*[A-Z]?/) { |foo, bar, baz| baz } }.to raise_error(ArgumentError)
                expect { range.my_any?(Symbol, /\w+\d*[A-Z]?/) { false } }.to raise_error(ArgumentError)
                expect { range.my_any?(Symbol, /\w+\d*[A-Z]?/) { |foo| foo } }.to raise_error(ArgumentError)
                expect { range.my_any?(Symbol, /\w+\d*[A-Z]?/) { |foo, bar| bar } }.to raise_error(ArgumentError)
                expect { range.my_any?(Symbol, /\w+\d*[A-Z]?/) { |foo, bar, baz| baz } }.to raise_error(ArgumentError)
              end
            end
          end
        end
      end # more than 1 argument
    end
  end
end
