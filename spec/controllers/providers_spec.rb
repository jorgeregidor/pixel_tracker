require "rails_helper"

RSpec.describe ProvidersController do
	
	describe "ProvidersController" do

  	describe "logged" do

			before(:each) do
 				@user = User.create!(email: "admin@admin.com", password: "admin1", password_confirmation: "admin1")
 				@provider = Provider.create!(name: "Provider", user_id: @user.id)
		    sign_in(@user)
  		end
  		
  		describe "GET index" do

		    it "renders the index template" do
		      get :index
		      expect(response).to render_template(:index)
		    end

		    it "correct response" do
		      get :index
		      expect(assigns(:providers)).to eq([@provider])
		    end

		  end

		  describe "GET new" do

		    it "renders the new template" do
		      get :new
		      expect(response).to render_template(:new)
		    end

		    it "create a new provider" do
		      get :new
		      expect(assigns(:provider)).to be_a_new(Provider)
		    end
		  end

		  describe "GET edit" do

		    it "renders the edit template" do
		      get :edit ,params: {id: @provider.id}
		      expect(response).to render_template(:edit)
		    end

		     it "correct response" do
		      get :edit ,params: {id: @provider.id}
		      expect(assigns(:provider)).to eq(@provider)
		    end

		  end

		  describe "POST create" do

		    it "fail and redirect to new" do
		      post :create ,params: {provider: {name: @provider.name}}
		      expect(response).to render_template(:new)
		    end

		  end

		  describe "PUT update" do

		   	it "correct answer" do
		      put :update ,params: {id: @provider.id, provider: {name: "test"}}
		      expect(response).to redirect_to provider_url
		    end

		    it "fail name empty and renders the edit template" do
		      put :update ,params: {id: @provider.id, provider: {name: ""}}
		      expect(response).to render_template(:edit)
		    end

		  end

		  describe "DELETE destroy" do

		   	it "correct answer" do
		      delete :destroy ,params: {id: @provider.id}
		      expect(response).to redirect_to root_url
		    end

		  end

		  describe "GET SHOW" do

		   	it "correct answer" do
		      get :show ,params: {id: @provider.id}
		      expect(response).to render_template(:show)
		    end

		  end

	    
	  end

	  describe "Not logged" do
			
			it "index redirect to login" do
		     get :index
		     expect(response).to redirect_to new_user_session_path
		  end

		  it "show redirect to login" do
		     get :show, params: {id: 1}
		     expect(response).to redirect_to new_user_session_path
		  end

		  it "create redirect to login" do
		     post :create
		     expect(response).to redirect_to new_user_session_path
		  end

		  it "new redirect to login" do
		     get :new
		     expect(response).to redirect_to new_user_session_path
		  end

		  it "edit redirect to login" do
		     get :edit, params: {id: 1}
		     expect(response).to redirect_to new_user_session_path
		  end

		  it "update redirect to login" do
		     put :update, params: {id: 1}
		     expect(response).to redirect_to new_user_session_path
		  end

		  it "destroy redirect to login" do
		     delete :destroy, params: {id: 1}
		     expect(response).to redirect_to new_user_session_path
		  end


		end

	  
	end
end
