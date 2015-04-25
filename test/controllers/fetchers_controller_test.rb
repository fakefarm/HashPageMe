require 'test_helper'

class FetchersControllerTest < ActionController::TestCase
  setup do
    @fetcher = fetchers(:one)
  end

  context "#index" do
    context "path" do
      should 'succeeds when called' do
        get :index
        assert_response :success
        assert_not_nil assigns(:fetchers)
      end
    end

    context "action" do
      should 'has a title' do
        get :index
      end
    end
  end

  test "should show fetcher" do
    # TwitterClientWrapper.any_instance.expects(:get_all_tweets).returns([Twitter::Tweet.new(:id => 1, :body => "some viral tweet")])
    # Not sure how to test a show page.
    # _dw HOW DO I TEST THIS?
    get :show, id: 1
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fetcher
    assert_response :success
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
end
