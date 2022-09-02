class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found_response
    
    def show
        client = Client.find(params[:id])
        render json: client
    end

    private
    def render_record_not_found_response(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :not_found
    end

end
