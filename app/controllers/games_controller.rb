class GamesController < ApplicationController
  def index
    render json: Game.all
  end

  def user_index
    render json: Game.where('user_id = ?', current_user.id)
  end

  def create
    @game = Game.new(game_params)
    @game.user_id = current_user.id

    if @game.save
      render json: @game, status: :created
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  def update
    render json: ['UPDATE']
  end

  def destroy
    render json: ['DESTROY']
  end

  private
  def game_params
    params.require(:game).permit([
      :discs,
      :moves,
      :time
    ])
  end
end
