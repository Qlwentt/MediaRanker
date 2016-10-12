require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

   test "should get show" do
    get :show, {id: albums(:no_escape) }
    assert_response :success
  end

  test "should get edit" do
    get :edit, {id: albums(:no_escape) }
    assert_response :success
  end

  test "should be able to update an album" do
    update_params = {album:{name: albums(:no_escape).name, artist: albums(:no_escape).artist}, id: albums(:no_escape).id}
    put :update , update_params
    assert_response :redirect
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should be able to create an album" do
    post_params = {album:{name: "Sensory Overload", artist: "Your mom"}}
    post :create, post_params
    assert_response :redirect
  end

   test "Creating an album changes the number of albums" do
    assert_difference("Album.count",1) do 
       post_params = {album:{name: "Sensory Overload", artist: "Your mom"}}
       post :create, post_params
    end
  end

   test "should be able to delete an album" do
    assert_difference("Album.count",-1) do 
      delete :destroy, {id: albums(:no_escape).id}
      assert_response :redirect
    end
  end

end
