class FetchersController < ApplicationController
  before_action :set_fetcher, only: [:show, :edit, :update, :destroy]
  helper_method :get_tweets
  include TwitterUtilities

  def index
    @fetchers = Fetcher.all
  end

  def show
    # _dw TODO - make params create a new fetcher.

    client = TwitterClientWrapper.new
    @profile_pic = client.client.user(@fetcher.username).profile_image_uri.to_s
    tweets = client.get_all_tweets(@fetcher.username)

    # _dw Code Review
    @banner  = BannerPresenter.new(tweets).banner
    @banner_image  = BannerPresenter.new(tweets).image
    @banner_text  = BannerPresenter.new(tweets).text
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
    def set_fetcher
      @fetcher = Fetcher.find_by_slug(params[:id])
    end

    def fetcher_params
      params.require(:fetcher).permit(:username, :slug)
    end
end
