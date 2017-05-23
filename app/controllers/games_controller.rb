class GamesController < ApplicationController

  def index
    @game = Game.new
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @path = @game.find_path
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to @game, notice: 'Game was successfully created.'
    else
      redirect_to games_path
    end
  end

  def toggle
    @game = Game.find(params[:game_id])
    @point = @game.points.find_by(x: params[:x], y: params[:y])
    @point.update_attributes(busy: !@point.busy)
    @path = @game.find_path
  end

  private

    def game_params
      params.require(:game).permit(:title)
    end
end
