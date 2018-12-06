class ProvidersController < ApplicationController
  before_action :authenticate_user!

  before_action :set_provider, only: [:show, :edit, :update, :destroy]

  # GET /providers
  # GET /providers.json
  def index
    @providers = current_user.providers.all
  end

  # GET /providers/1
  # GET /providers/1.json
  def show
  end

  # GET /providers/new
  def new
    @provider = Provider.new
  end

  # GET /providers/1/edit
  def edit
  end

  # POST /providers
  def create
    @provider = Provider.new(provider_params)
    @provider.user_id = current_user.id

    if @provider.save
      redirect_to @provider
    else
      flash.now[:error] = @provider.errors.full_messages
      render :new
    end
  end

  # PATCH/PUT /providers/1
  def update
    if @provider.update(provider_params)
      redirect_to @provider
    else
      flash.now[:error] = @provider.errors.full_messages
      render :edit
    end
  end

  # DELETE /providers/1
  def destroy
    @provider.destroy
    redirect_to root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider
      @provider = current_user.providers.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provider_params
      params.require(:provider).permit(:name)
    end
end
