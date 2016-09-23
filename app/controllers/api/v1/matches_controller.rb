class Api::V1::MatchesController < ApplicationController

  def index

  @matches=Match.all
  @games = Game.all

  render json: @matches

  end

end
