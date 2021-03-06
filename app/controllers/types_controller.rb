class TypesController < ApplicationController

  # GET /types
  # GET /types.json
  # Obtiene todos los tipos y los renderiza en la misma vista
  def index
    @types = Type.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @types }
    end
  end

  # GET /types/1
  # GET /types/1.json
  # Muestra el tipo cuyo id se pasa como parámetro.
  def show
    @type = Type.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @type }
    end
  end

  # GET /types/new
  # GET /types/new.json
  # Muestra un formulario para añadir un nuevo tipo a la web.
  def new
    @type = Type.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @type }
    end
  end

  # GET /types/1/edit
  # Muestra una vista para editar el tipo cuyo id se pasa como parámetro.
  def edit
    @type = Type.find(params[:id])
  end

  # POST /types
  # POST /types.json
  # Muestra una vista con un mensaje de confirmación y el tipo creado.
  def create
    @type = Type.new(params[:type])

    respond_to do |format|
      if @type.save
        format.html { redirect_to @type, notice: 'Type was successfully created.' }
        format.json { render json: @type, status: :created, location: @type }
      else
        format.html { render action: "new" }
        format.json { render json: @type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /types/1
  # PUT /types/1.json
  # Muestra una vista para editar los parámetros del tipo.
  def update
    @type = Type.find(params[:id])

    respond_to do |format|
      if @type.update_attributes(params[:type])
        format.html { redirect_to @type, notice: 'Type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /types/1
  # DELETE /types/1.json
  # Elimina el tipo que se pasa como parámetro.
  def destroy
    @type = Type.find(params[:id])
    @type.destroy

    respond_to do |format|
      format.html { redirect_to types_url }
      format.json { head :no_content }
    end
  end

  # GET /ordered_index
  # GET /ordered_index
  # Muestra los tipos ordenados alfabéticamente.
  def ordered_index
    @types = Type.find(:all,:order => :name)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @types }
    end
  end

end