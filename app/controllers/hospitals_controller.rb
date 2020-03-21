class HospitalsController < ApplicationController
  def import
    Hospital.import(params[:file])
    
    redirect_to root_path, notice: "Arquivo importado com sucesso."
  end
end