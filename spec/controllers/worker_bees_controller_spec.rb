require 'rails_helper'

RSpec.describe WorkerBeesController, type: :controller do
    
    describe "GET #show" do

    	it 'renders show template' do 

			comb 	   = create(:comb)
    		worker_bee = create(:worker_bee)

            get :show, params: { id: worker_bee.id, comb_id: comb.id }
            expect(response).to render_template(:show)
        end
    end
end