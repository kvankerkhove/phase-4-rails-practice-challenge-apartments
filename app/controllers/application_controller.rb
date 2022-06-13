class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def render_invalid_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: 422
    end

    def render_not_found_response(invalid)
        render json: { error: "#{invalid.model} not found" }, status: :not_found
    end
end
