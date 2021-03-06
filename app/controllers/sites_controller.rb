class SitesController < ApplicationController

  # authenticate_user! ejecuta acción solo si sesión existe
  before_filter :authenticate_user!, :except => [ :index, :show ]
  after_filter :count_visita, :only => :show
  # para que solo se ejecute count_visita al realizar la accion show
  
  # GET /sites
  # GET /sites.json
  # Obtiene todos los sitios y los renderiza en la misma vista
  def index
    if params[:type_id].nil? or params[:type_id].empty?
      @sites = Site.all            # path: /types
      else
      @sites = Type.find(params[:type_id]).sites  # path: /types/id/sites
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sites }
    end
  end

  # GET /sites/1
  # GET /sites/1.json
  # Muestra el siio cuyo id se pasa como parámetro.
  def show
    @site = Site.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @site }
    end
  end

  # GET /sites/new
  # GET /sites/new.json
  # Muestra un formulario para añadir un nuevo sitio a la web.
  def new
    @site = current_user.sites.build # crea sitio vacio asociado a current_user

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @site }
    end
  end

  # GET /sites/1/edit
  # Muestra una vista para editar el sitio cuyo id se pasa como parámetro.
  def edit
    @site = current_user.sites.find(params[:id])  # busca solo en sitios asociados a current_user
  end

  # POST /sites
  # POST /sites.json
  # Muestra una vista con un mensaje de confirmación y el sitio creado.
  def create
    @site = current_user.sites.build(params[:site]) # Asigna solo si sitio asociado a current_user
    
    respond_to do |format|
      if @site.save
        format.html { redirect_to @site, notice: 'Site was successfully created.' }
        format.json { render json: @site, status: :created, location: @site }
      else
        format.html { render action: "new" }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sites/1
  # PUT /sites/1.json
  # Muestra una vista para editar los parámetros del sitio.
  def update
    @site = current_user.sites.find(params[:id])  # busca solo en sitios asociados a current_user 
    
    respond_to do |format|
      if @site.update_attributes(params[:site])
        format.html { redirect_to @site, notice: 'Site was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  # Elimina el sitio que se pasa como parámetro.
  def destroy
    @site = current_user.sites.find(params[:id])  # busca solo en sitios asociados a current_user
    @site.destroy

    respond_to do |format|
      format.html { redirect_to sites_url }
      format.json { head :no_content }
    end
  end

  # Aumenta las visitas de un sitio.
  private
  def count_visita
    @site.increment!(:visitas)
  end

end