# frozen_string_literal: true

require './ex0/ex0'

describe Ex0::Dog do
  let(:name) { 'Puppy' }
  subject { described_class.new(name) }

  context '#greet' do
    it 'greets you' do
      expect(subject.greet).to eq(name)
    end

    context 'change name with metaprogramming' do
      context '0. call private method' do
        it 'should change name' do
          subject.send(:name=, 'Lassie')
          expect(subject.greet).to eq('Lassie')

          # another way
          subject.instance_variable_set(:@name, 'Laddie')
          expect(subject.greet).to eq('Laddie')
        end
      end

      context '1. define singleton method' do
        it 'should change name' do
          def subject.change1(new_name)
            self.name = new_name
          end
          subject.change1('Santos')
          expect(subject.greet).to eq('Santos')

          # another way
          subject.define_singleton_method(:change1b) do |new_name|
            self.name = new_name
          end
          subject.change1b('Mentos')
          expect(subject.greet).to eq('Mentos')
        end
      end

      context '2. using mixins' do
        before do
          module AdditionalMethods
            def change2(new_name)
              self.name = new_name
            end
          end

          subject.extend(AdditionalMethods)
        end

        it 'should change name' do
          subject.change2('Scooby')
          expect(subject.greet).to eq('Scooby')
        end
      end

      context '3. define class method' do
        before do
          subject.class.define_method(:change3) do |new_name|
            self.name = new_name
          end
        end

        it 'should change name' do
          subject.change3('Nemo')
          expect(subject.greet).to eq('Nemo')

          # however, this changes all objects of this class
          other = described_class.new('Foo')
          other.change3('Bar')
          expect(other.greet).to eq('Bar')
        end
      end
    end
  end
end