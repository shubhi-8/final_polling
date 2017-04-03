class AddIsPubToPubQuest < ActiveRecord::Migration
  def change
  	 add_column :pub_quests, :is_pub, :boolean, :default => true
  end
end
