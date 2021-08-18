require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'renders the new users template' do
      get :new

      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    let(:user_params) do {
      user:{
        username: 'tony',
        password: 'password'
      }
    }
    end
    context 'with valid params' do
      it 'logs in the user' do
        post :create, params: user_params
        user = User.find_by(username:'tony')
        expect(session[:session_token]).to eq(user.session_token)
      end

      it 'redirects to the users show page' do
        post :create, params: user_params
        user = User.find_by(username: 'tony')
        expect(response).to redirect_to(user_url(user))
      end
    end

    context 'with invalid params' do
      it 'validates the presence of username and password' do
        post :create, params: {user: {username: '', password: ''}}
        expect(response).to render_template(:new)
      end

    end


  end

end