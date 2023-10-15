class PlayersController < ApplicationController
  def index
    @players = Player.order(:first_name, :last_name)

    if params[:search].present?
      @players = @players.where('first_name LIKE ? OR last_name LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%")
    end

    @players = @players.where(position: params[:position]) if params[:position].present?

    @players = @players.paginate(page: params[:page], per_page: 40)
  end

  def show
    @player = Player.find(params[:id])
  end
end
