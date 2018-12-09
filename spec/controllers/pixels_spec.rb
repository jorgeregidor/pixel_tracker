require "rails_helper"

RSpec.describe PixelsController do
	
	describe "PixelsController" do

  	describe "create" do

			before(:each) do
 				@user = User.create!(email: "admin@admin.com", password: "admin1", password_confirmation: "admin1")
 				@provider = Provider.create!(name: "Provider", user_id: @user.id)
 				@pixel = Pixel.create!(provider_id: @provider.id, name: "pixel")
  		end
  		
  		describe "POST create" do

		    it "correct response" do
		      post :create ,params: {pixel: {name: "test", provider_id: @provider.id}}
		      expect(response.status).to eq(200)
		    end

		    it "correct response url" do
		      post :create ,params: {pixel: {name: "test", provider_id: @provider.id}}
		      resp = JSON.parse(@response.body)
		      expect(resp["url"]).to eq("#{root_url}images/conversion.png?trackid=#{assigns(:pixel).id}")
		    end

		    it "fail and redirect to new" do
		      post :create ,params: {pixel: {name: @pixel.name, provider_id: @provider.id}}
		      expect(response.status).to eq(400)
		    end

		  end

		  describe "GET conversion" do

		    it "correct response" do
		      get :conversion ,params: {trackid: @pixel.id}
		      expect(response.status).to eq(200)
		    end

		    it "fail and redirect to new" do
		      get :conversion ,params: {trackid: nil}
		      expect(response.status).to eq(204)
		    end

		  end
		end
	end
end
