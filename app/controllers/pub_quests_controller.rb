class PubQuestsController < ApplicationController
  
  before_action :set_pub_quest, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! ,except: [:index]

  # GET /pub_quests
  # GET /pub_quests.json
  def index
    @pub_quests = PubQuest.all
  end

  # GET /pub_quests/1
  # GET /pub_quests/1.json
  def show
    @pub_quest= PubQuest.includes(:choices).find(params[:id])
    if current_user.voted_for?(@pub_quest)
      redirect_to "/votes/count/#{@pub_quest.id}"
    else
      render :show, status: :created, location: @pub_quest
    end
  end

  # GET /pub_quests/new
  def new
    @pub_quest = PubQuest.new
    2.times { choice = @pub_quest.choices.build}
  end

  # GET /pub_quests/1/edit
  def edit
  end
  
  # POST /pub_quests
  # POST /pub_quests.jsdef create
  def create
  @pub_quest = PubQuest.new(pub_quest_params)
  
    respond_to do |format|
      if @pub_quest.save
        format.html { redirect_to @pub_quest, notice: 'Pub quest was successfully created.' }
        format.json { render :show, status: :created, location: @pub_quest }
      else
        format.html { render :new }
        format.json { render json: @pub_quest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pub_quests/1
  # PATCH/PUT /pub_quests/1.json
  def update
    respond_to do |format|
      if @pub_quest.update(pub_quest_params)
        format.html { redirect_to @pub_quest, notice: 'Pub quest was successfully updated.' }
        format.json { render :show, status: :ok, location: @pub_quest }
      else
        format.html { render :edit }
        format.json { render json: @pub_quest.errors, status: :unprocessable_entity }
      end
    end
  end

  def user_profile
  @mypolls = PubQuest.where(:user_id => current_user.id)
  
  end 

  # DELETE /pub_quests/1
  # DELETE /pub_quests/1.json
  def destroy
    @pub_quest.destroy
    respond_to do |format|
      format.html { redirect_to pub_quests_url, notice: 'Pub quest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pub_quest
     @pub_quest = PubQuest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pub_quest_params
    params.require(:pub_quest).permit(:name,choices_attributes: [:id,:pub_quest_id,:name,:_destroy])
    end
end
