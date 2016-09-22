class MatchesController < ApplicationController

def index
  @games=Game.all

  @matches=Match.all { |e|  }
  @filterrific = initialize_filterrific(
       Match,
       params[:filterrific],
       select_options: {
         sorted_by: Match.options_for_sorted_by,
         with_game_id: Game.options_for_select
       },
       persistence_id: 'shared_key',
       default_filter_params: {},
       available_filters: [],
     ) or return
     respond_to do |format|
       format.html
       format.js
     end


    rescue ActiveRecord::RecordNotFound => e
       # There is an issue with the persisted param_set. Reset it.
       puts "Had to reset filterrific params: #{ e.message }"
       redirect_to(reset_filterrific_url(format: :html)) and return

end


def show
  @match = Match.find(params[:id])
end

def new
    @match = Match.new
    @games = Game.all
end

def create
  @language = ['Spanish','English','Portuguese','Russian','German','French','Italian']
  @games =Game.all
  @match = Match.new(match_params)
  @match.owner_id = current_player.id
  current_player.matches.push(@match)
  respond_to do |format|
    if @match.save
      format.html { redirect_to @match, notice: 'Match was successfully created.' }
    else
      format.html { render :new }
    end
  end
end

def edit
  @match = Match.find(params[:id])
  if @match.owner_id === current_player.id
    redirect_to @match
  else
    render :new
  end
end

def update
  @match = Match.find(params[:id])
  respond_to do |format|
    if @match.update(match_params)
      format.html { redirect_to @match, notice: 'Match was successfully updated.' }
    else
      format.html { render :edit }
    end
  end
end


private

  # Never trust parameters from the scary internet, only allow the white list through.
  def match_params
    params.require(:match).permit(:name, :language, :game_id,:owner_id,:star_time,:mastered)
  end
end
