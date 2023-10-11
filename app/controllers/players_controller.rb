class PlayersController < ApplicationController
  def index
    @players = Player.order(:first_name, :last_name).paginate(page: params[:page], per_page: 40)
  end  

  def show
    @player = Player.find(params[:id])
  end
end
