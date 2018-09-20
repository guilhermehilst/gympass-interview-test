class RacesController < ApplicationController

  def index
  end

  def create
    @race = Race.new(race_params)

    @race.save
  end

  private

  def race_params
    params.require(:race).permit(:name)
  end
end
