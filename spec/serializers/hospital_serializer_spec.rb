require 'rails_helper'

describe HospitalSerializer do
  subject(:serializer) { described_class }
  let!(:hospital) { create(:hospital) }

  describe '.serialize_array' do
    subject { serializer.new(hospital) }
    let(:hospital_serialized) { ActiveModelSerializers::Adapter.create(subject).to_json }
    let(:serialized_keys) { JSON.parse(hospital_serialized).keys }

    before do
      @keys = [
        'id',
        'name',
        'address',
        'city',
        'phone',
        'geocode',
      ]
    end

    it 'returns the right keys' do
      expect(serialized_keys).to match_array(@keys)
    end
  end
end