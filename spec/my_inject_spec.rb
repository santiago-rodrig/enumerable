# frozen_string_literal: true

require_relative '../enumerable'

describe '#my_inject' do
  let(:array_numbers) { [1, 3, 4, 5, 234, -234, 23] }
  let(:array) { [1, 2, [3, 4], '5', :six, :seven] }
  let(:range) { 1..100 }
  let(:hash) { { name: 'sam', position: 'general', medals: 967 } }

  # rubocop:disable Metrics/BlockLength
  context 'with one argument and no block' do
    context 'argument is not a symbol' do
      context 'an array' do
        it 'raises TypeError' do
          expect { array.my_inject(2) }.to raise_error(TypeError)
        end
      end

      context 'a hash' do
        it 'raises TypeError' do
          expect { hash.my_inject([1, 2]) }.to raise_error(TypeError)
        end
      end

      context 'a range' do
        it 'raises TypeError' do
          expect { range.my_inject(-23) }.to raise_error(TypeError)
        end
      end
    end

    context 'argument is a symbol' do
      context 'all elements share a combination method' do
        subject { collection.my_inject(:+) }

        context 'an array' do
          let(:collection) { array_numbers }

          it('returns the sum of the numbers') { should eq(36) }
        end

        context 'a hash' do
          let(:collection) { hash }

          it 'returns the sum of the key-value pairs' do
            should eq(hash.to_a.flatten)
          end
        end

        context 'a range' do
          let(:collection) { range }

          it('returns the sum of the sequence') { should eq(5050) }
        end
      end

      context 'not all elements share a combination method' do
        context 'an array' do
          it 'raises TypeError' do
            expect { array.my_inject(:+) }.to raise_error(TypeError)
          end
        end
      end

      context 'the method is not available for the first element' do
        context 'an array' do
          it 'raises NameError' do
            expect { array.my_inject(:upcase) }.to raise_error(NameError)
          end
        end

        context 'a hash' do
          it 'raises NameError' do
            expect { hash.my_inject(:swapcase) }.to raise_error(NameError)
          end
        end

        context 'a range' do
          it 'raises NameError' do
            expect { range.my_inject(:pop) }.to raise_error(NameError)
          end
        end
      end
    end
  end

  context 'with two arguments and no block' do
    context 'all elements share a combination method' do
      context 'an array' do
        subject { array_numbers.my_inject(7, :+) }

        it 'starts with the first argument' do
          should eq(array_numbers.my_inject(:+) + 7)
        end

        it 'returns the combination of all elements' do
          should eq(43)
        end
      end

      context 'a hash' do
        subject { hash.my_inject([:power, 'convincement'], :+) }

        it 'starts with the first argument' do
          should eq([:power, 'convincement'] + hash.my_inject(:+))
        end

        it 'returns the combination of all elements' do
          should eq([:power, 'convincement'] + hash.to_a.flatten)
        end
      end

      context 'a range' do
        subject { range.my_inject(9, :+) }

        it 'starts with the first argument' do
          should eq(9 + range.my_inject(:+))
        end

        it 'returns the combination of all elements' do
          should eq(5059)
        end
      end
    end

    context 'not all elements share a combination method' do
      context 'an array' do
        it 'raises TypeError' do
          expect { array.my_inject(0, :+) }.to raise_error(TypeError)
        end
      end
    end

    context 'the argument does not have the method' do
      context 'an array' do
        it 'raises TypeError' do
          expect { array.my_inject('a', :+) }.to raise_error(TypeError)
        end
      end

      context 'a hash' do
        it 'raises TypeError' do
          expect { hash.my_inject('a', :+) }.to raise_error(TypeError)
        end
      end

      context 'a range' do
        it 'raises TypeError' do
          expect { range.my_inject('a', :+) }.to raise_error(TypeError)
        end
      end
    end
  end

  context 'with one argument and a block of 0 variables' do
    subject { collection.my_inject('whatever') { 'banzai' } }

    context 'an array' do
      let(:collection) { array }

      it 'returns the block returned value' do
        should eq('banzai')
      end
    end

    context 'a hash' do
      let(:collection) { hash }

      it 'returns the block returned value' do
        should eq('banzai')
      end
    end

    context 'a range' do
      let(:collection) { range }

      it 'returns the block returned value' do
        should eq('banzai')
      end
    end
  end

  context 'with one argument and a block of 1 variable' do
    context 'an array' do
      subject { array.my_inject(4) { |accumulated| accumulated + 1 } }

      it 'starts with the argument' do
        should eq(array.my_inject(0) { |accumulated| accumulated + 1 } + 4)
      end

      it 'adds the block returned value to the variable' do
        should eq(10)
      end
    end

    context 'a hash' do
      subject do
        hash.my_inject([:hobby, 'jogging']) do |accumulated|
          accumulated + [1]
        end
      end

      it 'starts with the argument' do
        should start_with(:hobby, 'jogging')
      end

      it 'adds the block returned value to the variable' do
        should eq([:hobby, 'jogging'] + [1] * 3)
      end
    end

    context 'a range' do
      subject { range.my_inject(0) { |accumulated| accumulated + 1 } }

      it 'starts with the argument' do
        should eq(1 + range.my_inject(-1) { |accumulated| accumulated + 1 })
      end

      it 'adds the block returned value to the variable' do
        should eq(100)
      end
    end
  end
  # rubocop:enable Metrics/BlockLength

  context 'with one argument and a block of 2 variables' do
    context 'an array' do
      it 'returns the memo' do
        expect(
          array_numbers.my_inject(0) { |memo, obj| memo + obj }
        ).to eq(36)
      end
    end

    context 'a hash' do
      it 'returns the memo' do
        expect(
          hash.my_inject([]) { |memo, obj| memo + obj }
        ).to eq(hash.to_a.flatten)
      end
    end

    context 'a range' do
      it 'returns the memo' do
        expect(
          range.my_inject(0) { |memo, obj| memo + obj }
        ).to eq(5050)
      end
    end
  end

  context 'with no arguments and a block of 0 variables' do
    context 'an array' do
      it 'returns the block returned value' do
        expect(array.my_inject { 'tamaya!' }).to eq('tamaya!')
      end
    end

    context 'a hash' do
      it 'returns the block returned value' do
        expect(hash.my_inject { 'nani!?' }).to eq('nani!?')
      end
    end

    context 'a range' do
      it 'returns the block returned value' do
        expect(
          range.my_inject { 'watashiha bob desu' }
        ).to eq('watashiha bob desu')
      end
    end
  end

  # rubocop:disable Metrics/BlockLength
  context 'with no arguments and a block of 1 variable' do
    context 'an array' do
      it 'starts with the first element' do
        expect(array_numbers.my_inject { |memo| memo + 1 } - 2).to eq(5)
      end

      it 'yields the memo' do
        expect(array_numbers.my_inject { |memo| memo + 1 }).to eq(7)
      end
    end

    context 'a hash' do
      it 'starts with the first element' do
        expect(
          hash.my_inject { |memo| memo + [19] }
        ).to start_with(:name, 'sam')
      end

      it 'yields the memo' do
        expect(
          hash.my_inject { |memo| memo + [19] }.size
        ).to eq(hash.size + 1)
      end
    end

    context 'a range' do
      it 'starts with the first element' do
        expect(
          range.my_inject { |memo| memo + 1 } - 1
        ).to eq(99)
      end

      it 'yields the memo' do
        expect(
          range.my_inject { |memo| memo + 1 }
        ).to eq(100)
      end
    end
  end
  # rubocop:enable Metrics/BlockLength

  context 'with no arguments and a block of 2 variables' do
    context 'an array' do
      it 'yields memo and object' do
        expect(
          array_numbers.my_inject { |memo, obj| memo + obj }
        ).to eq(36)
      end
    end

    context 'a hash' do
      it 'yields memo and object' do
        expect(
          hash.my_inject { |memo, obj| memo + obj }
        ).to eq(hash.to_a.flatten)
      end
    end

    context 'a range' do
      it 'yields memo and object' do
        expect(
          range.my_inject { |memo, obj| memo + obj }
        ).to eq(5050)
      end
    end
  end
end
