class Api::V1::HospitalsController < ApplicationController
  def index
    default_location = params[:query] ||= "-23.5428363, -46.637257"
    
    @hospitals = Hospital.within(5, origin: default_location.split(','))
                         .page(params[:page] || 1)
                         .per_page(params[:per_page] || 10)

    render(json: @hospitals, each_serializer: HospitalSerializer)
  end
end