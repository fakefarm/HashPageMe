class FetchersController < ApplicationController
  before_action :set_fetcher, only: [:show, :edit, :update, :destroy]
  helper_method :get_tweets

  # GET /fetchers
  # GET /fetchers.json
  def index
    @fetchers = Fetcher.all
  end

  # GET /fetchers/1
  # GET /fetchers/1.json
  def show
    @tweets = $client.get_all_tweets(@fetcher.username)
    @latest = @tweets.first.text
  end

  # GET /fetchers/new
  def new
    @fetcher = Fetcher.new
  end

  # GET /fetchers/1/edit
  def edit
  end

  # POST /fetchers
  # POST /fetchers.json

  def collect_with_max_id(collection=[], max_id=nil, &block)
    response = yield(max_id)
    collection += response
    response.empty? ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)
  end

  def get_tweets(user)
    $client.get_all_tweets(user)
  end

  def $client.get_all_tweets(user)
    collect_with_max_id do |max_id|
      options = {count: 200, include_rts: true}
      options[:max_id] = max_id unless max_id.nil?
      user_timeline(user, options)
    end
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

  # PATCH/PUT /fetchers/1
  # PATCH/PUT /fetchers/1.json
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

  # DELETE /fetchers/1
  # DELETE /fetchers/1.json
  def destroy
    @fetcher.destroy
    respond_to do |format|
      format.html { redirect_to fetchers_url, notice: 'Fetcher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fetcher
      @fetcher = Fetcher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fetcher_params
      params.require(:fetcher).permit(:username)
    end
end
