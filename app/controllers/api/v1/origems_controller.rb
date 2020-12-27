class Api::V1::OrigemsController < Api::V1::ApiController
    before_action :set_origem, only: [:show, :update, :destroy]
  
    # GET /api/v1/origems
    def index
      @origems = Origem.all
  
      render json: @origems
    end
  
    # GET /api/v1/origems/1
    def show
      render json: @origem
    end
  
    # POST /api/v1/origems
    def create
      @origem = Origem.new(origem_params)
  
      if @origem.save
        render json: @origem, status: :created
      else
        render json: @origem.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /api/v1/origems/1
    def update
      if @origem.update(origem_params)
        render json: @origem
      else
        render json: @origem.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /api/v1/origems/1
    def destroy
      @origem.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_origem
        @origem = Origem.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def origem_params
        params.require(:origem).permit(:nome, :descricao)
      end

  end