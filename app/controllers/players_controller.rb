class PlayersController < ApplicationController


  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:name, :email)
    end

end
