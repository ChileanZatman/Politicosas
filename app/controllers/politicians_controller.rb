class PoliticiansController < ApplicationController
  before_action :set_politician, only: [:show, :edit, :update, :destroy]

  # GET /politicians
  # GET /politicians.json
  def index
    @parties = PoliticalParty.all.paginate(page: params[:page], per_page: 2)
    @politicians = Politician.all
  end
  
  def mod
    if params[:search]
      @politicians = Politician.where("name LIKE :search", search: "%#{params[:search]}%").paginate(page: params[:page], per_page: 10)
    else
      @politicians = Politician.all.paginate(page: params[:page], per_page: 10)
    end
  end

  # GET /politicians/1
  # GET /politicians/1.json
  def show
    @politician = Politician.find(params[:id])
    @news = @politician.news.order(params[:release]).paginate(page: params[:page])
    @suggestion = News.new
  end

  # GET /politicians/new
  def new
    @parties = PoliticalParty.order(:name).to_a
    @politician = Politician.new
  end

  # GET /politicians/1/edit
  def edit
  end

  # POST /politicians
  # POST /politicians.json
  def create
    @politician = Politician.new(politician_params)

    respond_to do |format|
      if @politician.save
        format.html { redirect_to '/modpoliticos', notice: 'Politician was successfully created.' }
        format.json { render :show, status: :created, location: @politician }
      else
        format.html { render :new }
        format.json { render json: @politician.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /politicians/1
  # PATCH/PUT /politicians/1.json
  def update
    respond_to do |format|
      if @politician.update(politician_params)
        format.html { redirect_to '/modpoliticos', notice: 'Politician was successfully updated.' }
        format.json { render :show, status: :ok, location: @politician }
      else
        format.html { render :edit }
        format.json { render json: @politician.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /politicians/1
  # DELETE /politicians/1.json
  def destroy
    @politician.destroy
    respond_to do |format|
      format.html { redirect_to '/modpoliticos', notice: 'Politician was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_politician
      @politician = Politician.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def politician_params
      params.require(:politician).permit(:name, :birthdate, :position, :political_compass, :previous_position, :education, :president, :political_party_id, :picture)
    end
end
