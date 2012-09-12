class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
    	t.integer :answers_id
    	t.integer :questions_id
    	t.string :display_name
    	t.string :display_data
      t.timestamps
    end
  end
end
