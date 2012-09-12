class AddColumnToForms < ActiveRecord::Migration
  def change
  	add_column :forms , :forms_id ,:integer
  end
 #execute "CREATE SEQUENCE forms_forms_id_seq START 1"
end
