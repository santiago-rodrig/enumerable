# frozen_string_literal: true

require_relative '../enumerable.rb'

# we will build test cases for the following functions
# - my_all
# - my_any
# - my_none

describe Enumerable do
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
                      expect(array_of_strings.my_all? /\w+/).to be_truthy
                    end
                  end
                end
                context "one or more strings don't match" do
                  describe '#my_all?' do
                    it 'should return false' do
                      expect(array_of_strings.my_all? /\d*/).to be_falsy
                      expect(array_of_strings.my_all? /d/).to be_falsy
                    end
                  end
                end
              end
              context 'is not made of strings' do
                describe '#my_all?' do
                  it 'should return false' do
                    expect(array_of_numbers.my_all? /./).to be_falsy
                  end
                end
              end
            end
            context 'empty' do
              it 'should always return true' do
                expect([].my_all? /./).to be_truthy
                expect([].my_all? /\d\w\s[a-z0-9]/).to be_truthy
              end
            end
          end
          context 'hash or range' do
            context 'empty' do
              describe '#my_all?' do
                it 'should return true' do
                  expect({}.my_all? /\d*[abc][A-Z]/).to be_truthy
                  expect((0..-1).my_all? /\w\S\t.\.\-/).to be_truthy
                end
              end
            end
            context 'nonempty' do
              describe '#my_all?' do
                it 'should return false' do
                  expect(hash.my_all? /./).to be_falsy
                  expect(range.my_all? /\d+/).to be_falsy
                end
              end
            end
          end
        end

        context 'class' do
          context 'array' do
            context 'nonempty' do
              describe '#my_all?' do
                context 'all the elements are of the same class' do
                  it 'should return true' do
                  end
                end
                context 'one or more elements are not of the same class' do
                  it 'should return false' do
                  end
                end
              end
            end
            context 'empty' do
              describe '#my_all?' do
                it 'should return true' do
                end
              end
            end
          end
          context 'range' do
            context 'nonemty' do
              describe '#my_all?' do
                it 'should return true if the class is Integer' do
                end
                it 'should return false if the class is not Integer' do
                end
              end
            end
            context 'empty' do
              describe '#my_all?' do
                it 'should return true' do
                end
              end
            end
          end
          context 'hash' do
            context 'nonempty' do
              describe '#my_all?' do
                it 'should return true if the class is Array' do
                end
                it 'should return false if the class is not Array' do
                end
              end
            end
            context 'empty' do
              describe '#my_all?' do
                it 'should return true' do
                end
              end
            end
          end
        end
      end
    end

    context 'without arguments' do
      context 'array' do
        context 'empty' do
          describe '#my_all?' do
          end
        end
        context 'nonempty' do
          describe '#my_all?' do
          end
        end
      end
      context 'hash or range' do
        context 'empty' do
          describe '#my_all?' do
          end
        end
        context 'nonempty' do
          describe '#my_all?' do
          end
        end
      end
    end
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
