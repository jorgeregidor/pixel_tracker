require "rails_helper"

RSpec.describe PixelsController, type: :routing do
  describe "routes PixelsController" do

    it "routes to #create" do
      expect(:post => "/pixels").to route_to("pixels#create")
    end

    it "routes to #conversion" do
      expect(:get => "/images/conversion.png").not_to route_to("pixels#conversion")
    end

  end
end