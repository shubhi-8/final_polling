class AddUserAssociationToPubQuests < ActiveRecord::Migration
  def change
  	 add_column :pub_quest, :user_id, :integer
  end
end
