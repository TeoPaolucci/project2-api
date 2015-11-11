class GamesController < ApplicationController
  def index
    render json: Game.all
  end

  def user_index
    render json: Game.where('user_id = ?', current_user.id)
  end

  def create
    render json: ['CREATE']
  end

  def update
    render json: ['UPDATE']
  end

  def destroy
    render json: ['DESTROY']
  end
end
