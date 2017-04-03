class VotesController < ApplicationController

  helper :all
  def create
    if current_user && params[:pub_quest] && params[:pub_quest][:id] && params[:choice] && params[:choice][:id]
      @pub_quest = PubQuest.find_by_id(params[:pub_quest][:id])
      @choice= @pub_quest.choices.find_by_id(params[:choice][:id])
      
      if @choice && @pub_quest && !current_user.voted_for?(@pub_quest)
       @choice.votes.create(:user_id =>current_user.id, :pub_quest_id =>@pub_quest.id )
         # render js: 'alert(\'Your vote saved.\');'
          #byebug
        else
        #render js: 'alert(\'Your vote cannot be saved. Have you already voted?\');'
      end
    else
      #render js: 'alert(\'Your vote cannot be saved.\');'
    end
    redirect_to "/votes/count/#{@pub_quest.id}"
    

  end

  def count
    # puts "SUCCESS"
  # end
    @pub_quest = PubQuest.find_by_id(params[:id])
    puts @pub_quest
    @vote_count = []
    @all_choices = @pub_quest.choices
    @all_choices.each do |choice|
      c= Vote.where(pub_quest_id: @pub_quest.id , choice_id: choice.id).count
      @vote_count.push(c)
    end      
  end
  # helper_method :count

end
