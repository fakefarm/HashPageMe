class FetchersController < ApplicationController
  before_action :set_fetcher, only: [:show, :edit, :update, :destroy]
  helper_method :get_tweets
  include TwitterUtilities

  def index
    @fetchers = Fetcher.all
  end

  def show
    @tweets = TwitterClientWrapper.new.get_all_tweets(@fetcher.username)
    @latest = @tweets.first.text
  end

  def new
    @fetcher = Fetcher.new
  end

  def edit
  end

  def create
    @fetcher = Fetcher.new(fetcher_params)

    respond_to do |format|
      if @fetcher.save
        format.html { redirect_to @fetcher, notice: 'Fetcher was successfully created.' }
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
      @fetcher = Fetcher.find(params[:id])
    end

    def fetcher_params
      params.require(:fetcher).permit(:username)
    end
end
