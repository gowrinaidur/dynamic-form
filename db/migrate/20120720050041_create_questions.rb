class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
    	t.string :question_name
    	t.string :field_name
      t.timestamps
    end
  end
end
