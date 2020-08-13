class ApplicationController < ActionController::API

    rescue_from ActiveRecord::RecordNotFound, with: :not_found_record
    rescue_from ActionController::RoutingError, with: :render_404
    rescue_from ActionController::UnpermittedParameters, with: :unpermited_params
    
    def not_found_record
        render json: {
            msg: "Record not found",
            error: true
        }, status: 404
    end

    def render_404
        render json: {
            msg: "Request doesn't exist",
            error: true
        }, status: 404
    end

    def unpermited_params
        render json: { 
            msgs:  { 
                unknown_parameters: pme.params 
            }, 
            error: true
        }, status: :bad_request
    end
end
