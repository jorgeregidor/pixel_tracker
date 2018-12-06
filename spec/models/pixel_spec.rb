require "rails_helper"

RSpec.describe Pixel do
	
	describe "Pixel model" do

		before(:each) do
 				@user = User.create!(email: "admin@admin.com", password: "admin1", password_confirmation: "admin1")
 				@provider = Provider.create!(name: "Provider", user_id: @user.id)
  		end


		it "name validates_presence_of" do
	  	pixel = Pixel.new
	  	pixel.valid?
	  	expect(pixel.errors.keys).to eq([:provider, :name])
	  end

	  it "name provider_id validates_uniqueness_of" do
 			pixel = Pixel.create(name: 'Test', provider_id: @provider.id)
	  	pixel2 = Pixel.create(name: 'Test', provider_id: @provider.id)
	  	expect(pixel2.valid?).to_not be
	  end

	end
end