class GamesController < ApplicationController

  def index
    @game = Game.new
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @path = @game.path
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to @game, notice: 'Game was successfully created.'
    else
      redirect_to games_path
    end
  end

  private

    def game_params
      params.require(:game).permit(:title)
    end
end
