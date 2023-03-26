class HerosController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    def index 
        heros = Hero.all 
        render json: heros, status: :created
    end
    def show
        hero = Hero.find(params[:id]) 
        render json: hero,serializer: HeroListSerializer, status: :created
    end 
    private
    def record_not_found 
        render json: {error: "Hero not found"}, status: :not_found
    end
end
