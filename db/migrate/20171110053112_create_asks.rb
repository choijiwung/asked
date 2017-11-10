class CreateAsks < ActiveRecord::Migration
  def change
    create_table :asks do |t|
      t.string :name
      t.string :content
      
      t.timestamps null: false
    end
  end
end
