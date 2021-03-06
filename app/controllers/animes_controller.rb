class AnimesController < ApplicationController
  before_action :set_anime, only: [:show, :edit, :update, :destroy]
  before_action :set_tags, :set_authors, only: [:show, :new, :edit, :create, :update]
  before_action :set_params_tags, :set_author, :set_params_sites, only: [:update, :create]

  # GET /animes
  # GET /animes.json
  def index
    @animes = Anime.order :updated_at=>:desc
  end

  # GET /animes/1
  # GET /animes/1.json
  def show
  end

  # GET /animes/new
  def new
    @anime = Anime.new
  end

  # GET /animes/1/edit
  def edit
  end

  # POST /animes
  # POST /animes.json
  def create
    @anime = Anime.new(anime_params)
    @anime.tags = @params_tags
    @anime.sites = @params_sites
    @anime.author = @author

    respond_to do |format|
      if @anime.save
        format.html { redirect_to @anime, notice: 'Anime was successfully created.' }
        format.json { render :show, status: :created, location: @anime }
      else
        format.html { render :new }
        format.json { render json: @anime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animes/1
  # PATCH/PUT /animes/1.json
  def update
    @anime.tags = @params_tags
    @anime.author = @author
    @anime.sites = @params_sites

    respond_to do |format|
      if @anime.update(anime_params)
        format.html { redirect_to @anime, notice: 'Anime was successfully updated.' }
        format.json { render :show, status: :ok, location: @anime }
      else
        format.html { render :edit }
        format.json { render json: @anime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animes/1
  # DELETE /animes/1.json
  def destroy
    @anime.destroy
    respond_to do |format|
      format.html { redirect_to animes_url, notice: 'Anime was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anime
      @anime = Anime.friendly.find(params[:id])
    end

    def set_tags
      @tags = Tag.order :name
    end

    def set_params_tags
      @params_tags = []

      unless params[:tags].nil?
        params[:tags].each do |tag|
          @params_tags << Tag.find(tag)
        end
      end

      @params_tags
    end

    def set_params_sites
      @params_sites = []

      @params_sites = params[:sites] unless params[:sites].nil?

      @params_sites
    end

    def set_author
      @author = if params[:author].nil?
        Author::new
      else
        Author.friendly.find(params[:author])
      end
    end

    def set_authors
      @authors = Author.all.map do |a|
        [a.name, a.id]
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def anime_params
      params.require(:anime).permit(:title, :season, :season_title, :episode, :last_visited_url, :released_year)
    end
end
