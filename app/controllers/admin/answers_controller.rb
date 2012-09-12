class Admin::AnswersController < ApplicationController
	def index
		@questions=Question.all
		render :text=>"check"
	end
	def new
		@questions=Question.all
		@answer=Answer.new
		#render :text=>"New check"
	end
	def create
		#render :text=>params
		@answer=Answer.create!(params[:answer])		
		@answer.field_name=Question.find_by_id(@answer.questions_id).field_name
		
		if @answer.save
			redirect_to "/admin/questions"
		else
			render :action=>"new"
		end
	end
end
