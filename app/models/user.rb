class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
    
 has_many :pub_quest
 
 has_many :votes, dependent: :destroy
 has_many :choices, through: :votes
def voted_for?(pub_quest)
    choices(true).any? {
    	|v|
     v.pub_quest == pub_quest 
 }

 
end
 
end
