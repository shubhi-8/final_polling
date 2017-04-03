class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :choice
  belongs_to :pub_quest
  
  validates_uniqueness_of :pub_quest, scope: :user_id
  


end
