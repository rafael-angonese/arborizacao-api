class Api::V1::ArvoresController < Api::V1::ApiController
    before_action :set_arvore, only: [:show, :update, :destroy]
  
    # GET /api/v1/arvores
    def index
      arvores = Arvore.all
  
      render json: arvores.to_json(include: [:grupo, :genero, :familium, :origem])
    #   render json: @arvores
    end
  
    # GET /api/v1/arvores/1
    def show
        render json: @arvore.to_json(include: [:grupo, :genero, :familium, :origem])
    #   render json: @arvore
    end
  
    # POST /api/v1/arvores
    def create
      @arvore = Arvore.new(arvore_params)
  
      if @arvore.save
        render json: @arvore, status: :created
      else
        render json: @arvore.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /api/v1/arvores/1
    def update
      if @arvore.update(arvore_params)
        render json: @arvore
      else
        render json: @arvore.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /api/v1/arvores/1
    def destroy
      @arvore.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_arvore
        @arvore = Arvore.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def arvore_params
        params.require(:arvore).permit(:especie, :folha, :fruto, :raiz, :altura, :latitude, :longitude, :familium_id, :grupo_id, :origem_id, :genero_id)
      end

  end