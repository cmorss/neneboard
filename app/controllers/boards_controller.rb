class BoardsController < ApplicationController
  def index
    render :json => Board.all
  end
end
