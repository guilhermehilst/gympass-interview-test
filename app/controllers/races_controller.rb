class RacesController < ApplicationController

  def index
    @races = Race.all
  end

  def create
    @race = Race.new(race_params)

    ActiveRecord::Base.transaction do
      if @race.save
        Race::Parser.call(params[:file], @race)
      end
    end

    redirect_to @race
  end

  def show
    @race = Race.find(params[:id])
    @racer_infos = @race.racer_infos.order(:total_time)
    @best_lap = @race.racer_infos.order(:time_best_lap).first
  end

  private

  def race_params
    params.require(:race).permit(:name)
  end
end
