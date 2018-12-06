require "rails_helper"

RSpec.describe Conversion do
	
	describe "Conversion model" do

		before(:each) do
 				@user = User.create!(email: "admin@admin.com", password: "admin1", password_confirmation: "admin1")
 				@provider = Provider.create!(name: "Provider", user_id: @user.id)
 				@pixel = Pixel.create(name: 'Pixel', provider_id: @provider.id)
  		end


		it "pixel_id validates_presence_of" do
	  	conversion = Conversion.new
	  	conversion.valid?
	  	expect(conversion.errors.keys).to eq([:pixel])
	  end

	  it "pixel_id ip user_agent provider_id validates_uniqueness_of" do
 			conversion = Conversion.create(ip: '127.0.0.0', pixel_id: @provider.id, user_agent:"hello")
	  	conversion2 = Conversion.create(ip: '127.0.0.0', pixel_id: @provider.id, user_agent:"hello")
	  	expect(conversion2.valid?).to_not be
	  end

	end
end