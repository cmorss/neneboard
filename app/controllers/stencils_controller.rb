class StencilsController < ApplicationController
  def index
    @stencils = Stencil.all
    @themes = Theme.all

    render :json => {stencils: @stencils, themes: @themes}
  end

  def new
    @stencil = Stencil.new
  end

  def create
    @stencil = Stencil.new(params[:stencil])

    if @stencil.save
      redirect_to(stencils_path, :notice => 'Collaborator was successfully created.')
    else
      render :action => "new"
    end
  end

  def edit
    @stencil = Stencil.find(params[:id])
  end

  def destroy
    @stencil = Stencil.find(params[:id])
    @stencil.destroy
    redirect_to(stencils_path, notice: "Deleted stencil #{@stencil.name}")
  end
end
