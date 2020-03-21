class HospitalsController < ApplicationController
  def index
    @hospitals = Hospital.order('name').page(params[:page] || 1).per_page(30)

    render(json: @hospitals, each_serializer: HospitalSerializer)
  end

  def import
    Hospital.import(params[:file])
    
    redirect_to root_path, notice: "Arquivo importado com sucesso."
  end
end