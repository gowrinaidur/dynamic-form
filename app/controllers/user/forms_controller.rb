#$count=1
class User::FormsController < ApplicationController
	def index
		@forms=Form.all
		@z=Form.first
		if !@z.nil?
			@z=Form.first.display_name				
		end
		#render :text=>@z and return false
	end
	def new				
		@form=Form.new	
		@z=Form.first
		if @z.nil?		
			$count=0
		else
			$count=Form.last.forms_id
		end
	end
	def create	
		$count=$count+1			
	#render :text=>params and return false			
		keys=params.keys.map{|c| c.to_i if c.to_i!=0}
		user_form=keys.select{|c| c if c!=nil}	
		ggg=Hash.new		
		user_form.each do |x|
			if params[x.to_s].class==Array
				ggg["display_data"]=params[x.to_s].join(',')
			else
				ggg["display_data"]=params[x.to_s]	
			end
			ggg["answers_id"]=Answer.find_by_questions_id(x).id				
			ggg["questions_id"]=x
			ggg["display_name"]=Question.find_by_id(x).question_name
			ggg["forms_id"]=$count
			@form=Form.create!(ggg)			
			 @form.save			
		end		
			
		redirect_to "/user/forms"
	end
	def edit
		@form=Form.find(params[:id])		
		#render :text=>Question.find_by_id(@form.questions_id).field_name
	end
	def update
		#render :text=>params and return false
		keys=params.keys.map{|c| c.to_i if c.to_i!=0}
		user_form=keys.select{|c| c if c!=nil}	
		ggg=Hash.new		
		user_form.each do |x|
			if params[x.to_s].class==Array
				ggg["display_data"]=params[x.to_s].join(',')
			else
				ggg["display_data"]=params[x.to_s]	
			end
			# ggg["answers_id"]=Answer.find_by_questions_id(x).id				
			# ggg["questions_id"]=x
			# ggg["display_name"]=Question.find_by_id(x).question_name
			
			@form=Form.find(x)			
			 @form.update_attributes(ggg)		
		end		
		redirect_to "/user/forms"
	end
end
