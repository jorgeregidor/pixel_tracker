class PixelsController < ApplicationController
	skip_before_action :verify_authenticity_token
  
	# POST pixels/create, 
	# Params: name, provider_id
	# Return: pixel image url
	# Create a new pixel for a provider
  def create
  	@pixel = Pixel.new(pixel_params)

    if @pixel.save
    	render json: {"url": "#{root_url}images/conversion.png?trackid=#{@pixel.id}"}, status: "200"
    else
      render json: {"errors": @pixel.errors.full_messages}, status: "400"
    end
  end

  # GET images/conversion
  # Create a new conversion por a pixel
  def conversion
  end

  private

  	def pixel_params
      params.require(:pixel).permit(:name, :provider_id)
    end
end
