class Api::V1::FamiliasController < Api::V1::ApiController
    before_action :set_familia, only: [:show, :update, :destroy]
  
    # GET /api/v1/familias
    def index
      @familias = Familium.all
  
      render json: @familias
    end
  
    # GET /api/v1/familias/1
    def show
      render json: @familia
    end
  
    # POST /api/v1/familias
    def create
      @familia = Familium.new(familia_params)
  
      if @familia.save
        render json: @familia, status: :created
      else
        render json: @familia.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /api/v1/familias/1
    def update
      if @familia.update(familia_params)
        render json: @familia
      else
        render json: @familia.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /api/v1/familias/1
    def destroy
      @familia.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_familia
        @familia = Familium.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def familia_params
        params.require(:familia).permit(:nome, :descricao)
      end

  end