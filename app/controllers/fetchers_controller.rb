class FetchersController < ApplicationController
  before_action :set_fetcher, only: [:show, :edit, :update, :destroy]
  before_action :username
  before_action :tweets
  before_action :get_hashtags
  helper_method :hashtags
  include TwitterUtilities

  def index
  end

  def show
    @custom_tweets = CustomHashtagPresenter.new(@tweets).custom_tweets(params[:hashtag])
  end

  def about
    @about_tweets = AboutPresenter.new(@tweets).about_tweets(params[:hashtag])
  end

  def new
    @fetcher = Fetcher.new
  end

  def edit
  end

  def create
    @fetcher = Fetcher.new(fetcher_params)
    @fetcher.slug = fetcher_params['username']

    respond_to do |format|
      if @fetcher.save
        format.html { redirect_to "/#{@fetcher.slug}", notice: 'Fetcher was successfully created.' }
        format.json { render :show, status: :created, location: @fetcher }
      else
        format.html { render :new }
        format.json { render json: @fetcher.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @fetcher.update(fetcher_params)
        format.html { redirect_to @fetcher, notice: 'Fetcher was successfully updated.' }
        format.json { render :show, status: :ok, location: @fetcher }
      else
        format.html { render :edit }
        format.json { render json: @fetcher.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @fetcher.destroy
    respond_to do |format|
      format.html { redirect_to fetchers_url, notice: 'Fetcher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def get_hashtags
      @hashtags = CustomHashtagPresenter.new(@tweets).hashtags
    end

    def tweets
      @tweets = RawTweet.where(username: params[:id])
    end

    def username
      @username = params[:id]
    end

    def set_fetcher
      @fetcher = Fetcher.find_by_slug(params[:id])
    end

    def fetcher_params
      params.require(:fetcher).permit(:username, :slug)
    end
end
