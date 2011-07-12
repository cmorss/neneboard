class RenderersController < ApplicationController

  before_filter :find_stencil, :only => [:edit, :new]
  before_filter :find_style, :only => [:edit, :new]

  # GET /renderers/1
  # GET /renderers/1.xml
  def show
    @renderer = Renderer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @renderer }
    end
  end

  # GET /renderers/new
  # GET /renderers/new.xml
  def new
    @renderer = Renderer.new(stencil: @stencil, style: @style)

    respond_to do |format|
      format.html { render :template => '/renderers/edit' }
      format.xml  { render :xml => @renderer }
    end
  end

  # GET /renderers/1/edit
  def edit
    @renderer = Renderer.find(params[:id])
    if @renderer.style_id != @style.id
      @renderer = Renderer.new(style: @style, stencil: @stencil, script: @renderer.script)
    end
  end

  # before_filter:
  def find_style
    @style = Style.find(params[:style_id])
  end
  private :find_style

  # before_filter:
  def find_stencil
    @stencil = Stencil.find(params[:stencil_id])
  end
  private :find_stencil

  # POST /renderers
  # POST /renderers.xml
  def create
    @renderer = Renderer.new(params[:renderer])

    respond_to do |format|
      if @renderer.save
        format.html { redirect_to(stencils_url, :notice => 'Renderer was successfully created.') }
        format.xml  { render :xml => @renderer, :status => :created, :location => @renderer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @renderer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /renderers/1
  # PUT /renderers/1.xml
  def update
    @renderer = Renderer.find(params[:id])

    respond_to do |format|
      if @renderer.update_attributes(params[:renderer])
        format.html { redirect_to(stencils_url, :notice => 'Renderer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @renderer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /renderers/1
  # DELETE /renderers/1.xml
  def destroy
    @renderer = Renderer.find(params[:id])
    @renderer.destroy

    respond_to do |format|
      format.html { redirect_to(stencils_url) }
      format.xml  { head :ok }
    end
  end

  
end
