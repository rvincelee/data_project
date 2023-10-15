class TeamsController < ApplicationController
  def index
    @teams = Team.order(:name).all
  end

  def show
    @team = Team.find(params[:id])

    @players = if params[:search].present?
                 @team.players.where('first_name LIKE ? OR last_name LIKE ?', "%#{params[:search]}%",
                                     "%#{params[:search]}%")
               else
                 @team.players.order(:first_name, :last_name)
               end

    @players = @players.paginate(page: params[:page], per_page: 10)
  end
end
