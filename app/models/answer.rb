class Answer < ActiveRecord::Base
	has_many :forms
	belongs_to :question

end
