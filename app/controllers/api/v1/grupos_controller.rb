class Api::V1::GruposController < Api::V1::ApiController
    before_action :set_grupo, only: [:show, :update, :destroy]
  
    # GET /api/v1/grupos
    def index
      @grupos = Grupo.all
  
      render json: @grupos
    end
  
    # GET /api/v1/grupos/1
    def show
      render json: @grupo
    end
  
    # POST /api/v1/grupos
    def create
      @grupo = Grupo.new(grupo_params)
  
      if @grupo.save
        render json: @grupo, status: :created
      else
        render json: @grupo.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /api/v1/grupos/1
    def update
      if @grupo.update(grupo_params)
        render json: @grupo
      else
        render json: @grupo.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /api/v1/grupos/1
    def destroy
      @grupo.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_grupo
        @grupo = Grupo.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def grupo_params
        params.require(:grupo).permit(:nome, :descricao)
      end

  end