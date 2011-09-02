class ToolsController < ApplicationController

  def show
  end

  def load
    board = Board.find(params[:board_id])
    stencils = Stencil.all(:include => 'stencil_groups')

    stencil_to_group_map = {}

    stencils.each do |stencil|
      stencil_to_group_map[stencil.id] = stencil.stencil_group_ids
    end

    render :json => {
        board:    board,
        shapes:   board.shapes,
        artist:   Artist.find(params[:artist_id]),
        stencils: stencils,
        stencil_groups: StencilGroup.all,
        stencil_to_group_map: stencil_to_group_map,
        themes:   Theme.all
      }
  end
end