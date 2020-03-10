class CombsController < ApplicationController
	def index
		@combs = Comb.all
	end
end