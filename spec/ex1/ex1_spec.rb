# frozen_string_literal: true

require './ex1/ex1'

describe String do
  let(:valid_uuid) { '123e4567-e89b-12d3-a456-426614174000' }
  let(:nonsense)   { 'quick brown fox' }

  describe '.valid_uuid?' do
    context 'given valid UUID' do
      subject { valid_uuid }
      it 'returns true' do
        expect(subject).to be_valid_uuid
      end
    end

    context 'given non-UUID' do
      subject { nonsense }
      it 'returns false' do
        expect(subject).to_not be_valid_uuid
      end
    end
  end
end