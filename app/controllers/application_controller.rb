class ApplicationController < ActionController::Base
	include ActionController::Serialization
	skip_before_action :verify_authenticity_token
end
