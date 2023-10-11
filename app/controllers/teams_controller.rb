class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
    @players = @team.players.order(:first_name, :last_name).paginate(page: params[:page], per_page: 10)
  end
end
