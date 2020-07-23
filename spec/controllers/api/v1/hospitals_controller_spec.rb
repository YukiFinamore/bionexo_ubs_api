require 'rails_helper'

describe Api::V1::HospitalsController, type: :controller do
  let!(:hospitals) { create_list(:hospital, 5, geocode_lat: "-23.5428363", geocode_long: "-46.637257") }
  let(:parse_response) { JSON.parse(response.body) }

  describe 'GET #index' do
    context 'hospital methods successful' do
      before { get :index }

      let(:serialized_items) do
        ActiveModel::Serializer::CollectionSerializer.new(hospitals, serializer: HospitalSerializer).to_json
      end

      it { expect(response).to have_http_status(:ok) }
      it { expect(parse_response).to match_array(JSON.parse(serialized_items)) }
      it { expect(parse_response.count).to eq(5) }
    end
  end

  describe 'GET #find_by_term' do
    let(:params) { {search: "john"} }

    let!(:hospital_john_doe) do 
      create(
        :hospital,
        name: "John Doe", 
        geocode_lat: "-23.5428363", 
        geocode_long: "-46.637257"
      ) 
    end

    before { get :find_by_term, params: params }

    context 'find John Doe' do
      let(:serialized_items) do
        ActiveModel::Serializer::CollectionSerializer.new([hospital_john_doe], serializer: HospitalSerializer).to_json
      end

      it { expect(parse_response).to match_array(JSON.parse(serialized_items)) }
    end 
  end
end