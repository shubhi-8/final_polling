class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :user_id
      t.integer :pub_quest_id 
      t.integer :choice_id
      t.timestamps null: false
      
    end

  end
end
