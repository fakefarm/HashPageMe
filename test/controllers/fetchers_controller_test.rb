require 'test_helper'

class FetchersControllerTest < ActionController::TestCase
  setup do
    @fetcher = fetchers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fetchers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fetcher" do
    assert_difference('Fetcher.count') do
      post :create, fetcher: { username: @fetcher.username }
    end

    assert_redirected_to fetcher_path(assigns(:fetcher))
  end

  test "should show fetcher" do
    get :show, id: @fetcher
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fetcher
    assert_response :success
  end

  test "should update fetcher" do
    patch :update, id: @fetcher, fetcher: { username: @fetcher.username }
    assert_redirected_to fetcher_path(assigns(:fetcher))
  end

  test "should destroy fetcher" do
    assert_difference('Fetcher.count', -1) do
      delete :destroy, id: @fetcher
    end

    assert_redirected_to fetchers_path
  end
end
