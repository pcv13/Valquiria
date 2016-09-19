class PlayersController < ApplicationController
<<<<<<< HEAD

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


=======
>>>>>>> bf6136f1f4a987b88bf68a673029293171318f94
end
