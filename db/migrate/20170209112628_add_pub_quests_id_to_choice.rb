class AddPubQuestsIdToChoice < ActiveRecord::Migration
  def change
    add_column :choices, :pub_quest_id, :integer
  end
end
