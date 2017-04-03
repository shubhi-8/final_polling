require 'test_helper'

class PubQuestsControllerTest < ActionController::TestCase
  setup do
    @pub_quest = pub_quests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pub_quests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pub_quest" do
    assert_difference('PubQuest.count') do
      post :create, pub_quest: { name: @pub_quest.name, option: @pub_quest.option }
    end

    assert_redirected_to pub_quest_path(assigns(:pub_quest))
  end

  test "should show pub_quest" do
    get :show, id: @pub_quest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pub_quest
    assert_response :success
  end

  test "should update pub_quest" do
    patch :update, id: @pub_quest, pub_quest: { name: @pub_quest.name, option: @pub_quest.option }
    assert_redirected_to pub_quest_path(assigns(:pub_quest))
  end

  test "should destroy pub_quest" do
    assert_difference('PubQuest.count', -1) do
      delete :destroy, id: @pub_quest
    end

    assert_redirected_to pub_quests_path
  end
end
