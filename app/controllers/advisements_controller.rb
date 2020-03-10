class AdvisementsController < ApplicationController

	before_action :get_advisement

	def update
		if @advisement.update_attributes(advisement_params)
			flash[:success] = "Advisement overruled."
			redirect_to worker_bee_path(id: @advisement.worker_bee.id, comb_id: @advisement.comb.id)
		else
			flash[:failure] = "Failed to overrule advisement."
			redirect_to worker_bee_path(id: @advisement.worker_bee.id, comb_id: @advisement.comb.id)
		end
	end

	private

		def advisement_params
      		params.require(:advisement).permit(:is_overruled)
    	end

		def get_advisement
	    	@advisement = Advisement.find(params[:id])
	    end
end