require 'rails_helper'

RSpec.describe CombsController, type: :controller do

    describe "GET #index" do

        it "assigns @combs" do
            comb = create(:comb)
            get :index
            expect(assigns(:combs)).to eq([comb])
        end
        
        it 'renders index template' do 
            get :index
            expect(response).to render_template(:index)
        end
    end
end