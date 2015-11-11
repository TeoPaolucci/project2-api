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

  def show
    render json: Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])

    if @game.user_id != current_user.id
      render json: ['This isn\'t your record! You can\'t update this!'], status: :unprocessable_entity
    elsif @game.update_attributes(game_params)
      render json: @game, status: :updated
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @game = Game.find(params[:id])

    if @game.user_id != current_user.id
      render json: ['This isn\'t your record! You can\'t delete this!'], status: :unprocessable_entity
    else
      @game.destroy
      head :ok
    end
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
