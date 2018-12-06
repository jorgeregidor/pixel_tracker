require "rails_helper"

RSpec.describe Provider do
	
	describe "Provider model" do

		before(:each) do
 				@user = User.create!(email: "admin@admin.com", password: "admin1", password_confirmation: "admin1")
  		end


		it "name code validates_presence_of" do
	  	provider = Provider.new
	  	provider.valid?
	  	expect(provider.errors.keys).to eq([:user, :name])
	  end

	  it "name validates_uniqueness_of" do
 			provider = Provider.create(name: 'Test', user_id: @user.id)
	  	provider2 = Provider.create(name: 'Test', user_id: @user.id)
	  	expect(provider2.valid?).to_not be
	  end

	end
end