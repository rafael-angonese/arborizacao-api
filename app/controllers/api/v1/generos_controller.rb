class Api::V1::GenerosController < Api::V1::ApiController
    before_action :set_genero, only: [:show, :update, :destroy]
  
    # GET /api/v1/generos
    def index
      @generos = Genero.all
  
      render json: @generos
    end
  
    # GET /api/v1/generos/1
    def show
      render json: @genero
    end
  
    # POST /api/v1/generos
    def create
      @genero = Genero.new(genero_params)
  
      if @genero.save
        render json: @genero, status: :created
      else
        render json: @genero.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /api/v1/generos/1
    def update
      if @genero.update(genero_params)
        render json: @genero
      else
        render json: @genero.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /api/v1/generos/1
    def destroy
      @genero.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_genero
        @genero = Genero.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def genero_params
        params.require(:genero).permit(:nome, :descricao)
      end

  end