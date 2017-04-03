class Choice < ActiveRecord::Base
	 belongs_to :pub_quest
	 has_many :votes, dependent: :destroy

	 has_many :users, through: :votes
end
