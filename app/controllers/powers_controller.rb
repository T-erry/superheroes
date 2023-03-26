class PowersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
        
    def index
        powers = Power.all 
        render json: powers, status: :created 
    end
    def show 
        power = Power.find(params[:id])
        render json: power,  status: :accepted
    end
    def update 
        power = Power.find(params[:id])
        power.update!(power_params)
        render json: { message: 'Power updated successfully', power: power.as_json(only: [:id, :name, :description]) }, status: :created
    end
    private
    def record_not_found 
        render json: {error: "power not found"}, status: :not_found
    end
    def invalid_record(invalid)
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
        def power_params
        params.permit(:description)
    end
end
