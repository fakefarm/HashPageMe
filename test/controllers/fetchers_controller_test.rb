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

  context 'show action' do
    # NOTES
    # separate difference b/n path & action.
    # test "should show fetcher" do
    #   TwitterClientWrapper.client.expects(:get_all_tweets).with(@fetcher.username).returns()
    #   get :show, id: @fetcher
    #   assert_response :success
    # end
    # handle error cases gracefully
    # notes
    # what are we tesitng?
    # action responed succes when we fetch known user.
    should 'respond success when we fetch a known users tweets' do
      # NOTES
      # stub with a fake, known user so that we get tweets back when we make a call. asser that call is successful.
      # 1. what code i need to call?
      # we're testing controller, not twitter, and how the controller behaves in certain situations.
      # 2. start with stubs - what i need to stub
      #  TwitterWrapper
      # 3. what i need to check to make sure the test is successful
      require 'pry'; binding.pry
      @twitter  = MiniTest::Mock.new
      wrapper = TwitterClientWrapper.stubs(:client).returns('foo')
      wrapper.client.stubs(:)
        assert_equal product, Product.find(1)
      end

      user = fetchers(:one) # sets up environment needed
      tweets = [Twitter::Tweet.new(id: 1)]
      mock = TwitterClientWrapper.new
      mock.stubs(:client).returns('foo')
      mock.stubs(:get_all_tweets).returns(tweets)
      # We want get_all_tweets to return something.
      # TwitterClientWrapper.stubs(:client).returns(Object).stubs(:get_all_tweets).with(user.username).returns(tweets) # stubs() vs. expects() work in minitest.

      # TODO
      # refactor twitter client so it's not nested method.
      get :show, id: user.id
      assert_response :success
    end
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
