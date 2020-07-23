require 'rails_helper'

describe HospitalsController, type: :controller do
  describe 'POST #import' do
    context 'valid file' do
      let!(:file) { fixture_file_upload(Rails.root.join('spec', 'support', 'assets', 'ubs_funcionamentonone_test.csv')) }
        
      before { post :import, params: {file: file} }

      it { expect(Hospital.count).to eq(10) }
      it { expect(response).to have_http_status(:ok) }
    end
  end
end