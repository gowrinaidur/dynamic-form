class Admin::QuestionsController < ApplicationController
	def index
		@questions=Question.all	
		#render :text=>"helooooooooooooo"	
	end
	def new		
		@question=Question.new
	end
	def create
		@question=Question.create!(params[:question])		
		if @question.save
			redirect_to "/admin/questions"
		else
			render :action=>"new"
		end
	end
end
