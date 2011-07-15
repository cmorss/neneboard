class BoardsController < ApplicationController
  def index
    render :json => Board.all
  end

  def show
    render :json => Board.find(params[:id])
  end
end
