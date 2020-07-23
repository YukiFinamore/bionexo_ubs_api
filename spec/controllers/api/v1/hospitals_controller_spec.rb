require 'rails_helper'
require 'pry'

describe Api::V1::HospitalsController, type: :controller do
  describe 'GET #index' do
    let!(:hospitals) { create_list(:hospital, 5, geocode_lat: "-23.5428363", geocode_long: "-46.637257") }

    context 'hospital methods successful' do
      before { get :index }

      let!(:parse_response) { JSON.parse(response.body) }
      let(:serialized_items) do
        ActiveModel::Serializer::CollectionSerializer.new(hospitals, serializer: HospitalSerializer).to_json
      end

      it { expect(response).to have_http_status(:ok) }
      it { expect(parse_response).to match_array(JSON.parse(serialized_items)) }
      it { expect(parse_response.count).to eq(5) }
    end
  end
end