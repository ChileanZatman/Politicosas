class PoliticalPartiesController < ApplicationController
  before_action :set_political_party, only: [:show, :edit, :update, :destroy]

  # GET /political_parties
  # GET /political_parties.json
  def index
    @political_parties = PoliticalParty.all
  end
  
  # GET /political_parties/mod
  # GET /political_parties.json
  def mod
    if params[:search]
      @political_parties = PoliticalParty.where("name LIKE :search OR coalition LIKE :search", search: "%#{params[:search]}%").paginate(page: params[:page], per_page: 10)
    else
      @political_parties = PoliticalParty.all.paginate(page: params[:page], per_page: 10)
    end
  end

  # GET /political_parties/1
  # GET /political_parties/1.json
  def show
    @party = PoliticalParty.find(params[:id])
    @news = @party.news.order(params[:release]).paginate(page: params[:page], per_page: 5)
    @politicians = @party.politicians.order(params[:birthdate]).paginate(page: params[:page], per_page: 5)
    @suggestion = News.new
  end

  # GET /political_parties/new
  def new
    @political_party = PoliticalParty.new
  end

  # GET /political_parties/1/edit
  def edit
  end

  # POST /political_parties
  # POST /political_parties.json
  def create
    @political_party = PoliticalParty.new(political_party_params)

    respond_to do |format|
      if @political_party.save
        format.html { redirect_to @political_party, notice: 'Political party was successfully created.' }
        format.json { render :show, status: :created, location: @political_party }
      else
        format.html { render :new }
        format.json { render json: @political_party.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /political_parties/1
  # PATCH/PUT /political_parties/1.json
  def update
    respond_to do |format|
      if @political_party.update(political_party_params)
        format.html { redirect_to '/modpartidos', notice: 'Political party was successfully updated.' }
        format.json { render :show, status: :ok, location: @political_party }
      else
        format.html { render :edit }
        format.json { render json: @political_party.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /political_parties/1
  # DELETE /political_parties/1.json
  def destroy
    @political_party.destroy
    respond_to do |format|
      format.html { redirect_to '/modpartidos', notice: 'Political party was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_political_party
      @political_party = PoliticalParty.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def political_party_params
      params.require(:political_party).permit(:name, :founding, :political_compass, :coalition, :founding_ideology, :principles, :picture)
    end
end