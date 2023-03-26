class HeroPowersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
    wrap_parameters format: []
    def create
      heropower = HeroPower.new(hero_power_params)
      hero = Hero.find(heropower.hero_id)
      power = Power.find(heropower.power_id)
      if hero && power
          heropower = HeroPower.create!(hero_power_params)
          render json: hero, serializer: HeroListSerializer, status: :created
      else
          invalid_record
      end
    end
    private
    def invalid_record(invalid)
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
        def hero_power_params
        params.permit(:strength, :power_id, :hero_id)
    end
end
