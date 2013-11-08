class CreateDrawings < ActiveRecord::Migration
  def change
  	create_table :drawings  do |t|
  		t.belongs_to :user
  		t.string :title 
  		t.string :URL


  		t.timestamps
  end
end
