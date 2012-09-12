class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
    	t.integer :questions_id
    	t.string :answer_name
    	t.string :field_name
      t.timestamps
    end
  end
end
