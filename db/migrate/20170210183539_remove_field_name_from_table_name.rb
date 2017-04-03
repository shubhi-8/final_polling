class RemoveFieldNameFromTableName < ActiveRecord::Migration
  def change
    remove_column :pub_quests, :option, :integer
  end
end
