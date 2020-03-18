require 'rails_helper'

RSpec.describe AdvisementsController, type: :controller do

    describe "PUT #update" do

        let(:advisement_attr) { { :is_overruled => true } }

        before :each do
            comb        = create(:comb)
            worker_bee  = create(:worker_bee)
            @advisement = create(:advisement, comb_id: comb.id, worker_bee_id: worker_bee.id)
        end

        context "valid attributes" do

            it "locates @advisement" do
                put :update, params: { :id => @advisement.id, :advisement => advisement_attr }
                expect(assigns(:advisement)).to eq(@advisement)  
            end  

            it "changes @advisement's is_overruled attribute" do
                put :update, params: { :id => @advisement.id, :advisement => advisement_attr }
                @advisement.reload
                expect(@advisement.is_overruled).to eq(true)
            end 

            it "redirects to the relevant WorkerBee" do
                put :update, params: { :id => @advisement.id, :advisement => advisement_attr }
                expect(response).to redirect_to("/worker_bees/#{@advisement.worker_bee_id}?comb_id=#{@advisement.comb_id}")
            end
        end

        context "invalid attributes" do

            it "locates @advisement" do
                put :update, params: { :id => @advisement.id, :advisement => advisement_attr }
                expect(assigns(:advisement)).to eq(@advisement)        
            end
    
            it "does not change @advisement's is_overruled attribute" do
                put :update, params: { :id => @advisement.id, :advisement => { :is_overruled => nil } }
                @advisement.reload
                expect(@advisement.is_overruled).to eq(false)
            end
    
            it "redirects to the relevant WorkerBee" do
                put :update, params: { :id => @advisement.id, :advisement => advisement_attr }
                expect(response).to redirect_to("/worker_bees/#{@advisement.worker_bee_id}?comb_id=#{@advisement.comb_id}")
            end
        end
    end
end