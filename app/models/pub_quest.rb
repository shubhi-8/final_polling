class PubQuest < ActiveRecord::Base
	  
    has_many :choices , :dependent => :destroy
    accepts_nested_attributes_for :choices, :reject_if => :all_blank, :allow_destroy => true
    belongs_to :users

end
