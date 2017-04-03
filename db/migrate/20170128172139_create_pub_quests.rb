
class CreatePubQuests < ActiveRecord::Migration
  def change
    create_table :pub_quests do |t|
      t.text :name
      t.integer :option

      t.timestamps null: false
    end
  end
end
