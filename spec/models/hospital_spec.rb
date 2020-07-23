require 'rails_helper'

RSpec.describe Hospital, type: :model do
  # Presence
  it { should validate_presence_of(:geocode_lat) }
  it { should validate_presence_of(:geocode_long) }

  # Fields
  it { should have_db_column(:name).of_type(:string)}
  it { should have_db_column(:address).of_type(:string) }
  it { should have_db_column(:city).of_type(:string) }
  it { should have_db_column(:phone).of_type(:string) }
  it { should have_db_column(:geocode_lat).of_type(:float) }
  it { should have_db_column(:geocode_long).of_type(:float) }
  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }

  # Factories
  it 'Factory Hospital valid' do
    hospital = FactoryBot.build(:hospital)
    expect(hospital.valid?).to be true
  end

  it 'Factory Hospital invalid' do
    hospital = FactoryBot.build(:hospital, geocode_long: nil)
    expect(hospital.valid?).to_not be true
  end

  context '.import' do
    let!(:file) { fixture_file_upload(Rails.root.join('spec', 'support', 'assets', 'ubs_funcionamentonone_test.csv')) }
      
    before { described_class.import(file) }

    it { expect(Hospital.count).to eq(10) }
  end

  context 'build methods' do
    let!(:hospital) do
      {
        "no_fantasia" => "Vila das Belezas",
        "uf" => "SP",
        "cidade" => "São Paulo",
        "nu_telefone" => "(32)37223227",
        "lat" => "-13.6873233318325",
        "long" => "-39.4748640060413",
        "no_logradouro" => "CENTRO DE SAUDE SANTA TEREZINHA",
        "nu_endereco" => "44",
        "no_bairro"=> "Vila Paulista"
      }
    end

    context '.build_address' do
      it { expect(described_class.build_address(hospital)).to eq("CENTRO DE SAUDE SANTA TEREZINHA, 44 - Vila Paulista") }
    end

    context '.build_hospital' do
      let!(:keys) do
        [
          :name,
          :address,
          :city,
          :phone,
          :geocode_lat,
          :geocode_long
        ]
      end

      it { expect(described_class.build_hospital(hospital).keys).to eq(keys) }      
    end
  end
end