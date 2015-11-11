class GamesController < ApplicationController
  index

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
