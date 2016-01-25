class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :text, null: false
      t.integer :user_id, null: false
      t.float :lat, null: false
      t.float :lng, null: false 
    end
  end
end
