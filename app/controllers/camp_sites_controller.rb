class CampSitesController < ApplicationController
  before_action :set_camp_site, only: %i[ show edit update destroy ]

  # GET /camp_sites or /camp_sites.json
  def index
    @q = CampSite.ransack(params[:q])
    @camp_sites = @q.result
  end

  # GET /camp_sites/1 or /camp_sites/1.json
  def show
  end

  # GET /camp_sites/new
  def new
    @camp_site = CampSite.new
  end

  # GET /camp_sites/1/edit
  def edit
  end

  # POST /camp_sites or /camp_sites.json
  def create
    @camp_site = CampSite.new(camp_site_params)

    respond_to do |format|
      if @camp_site.save
        format.html { redirect_to camp_site_url(@camp_site), notice: "Camp site was successfully created." }
        format.json { render :show, status: :created, location: @camp_site }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @camp_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /camp_sites/1 or /camp_sites/1.json
  def update
    respond_to do |format|
      if @camp_site.update(camp_site_params)
        format.html { redirect_to camp_site_url(@camp_site), notice: "Camp site was successfully updated." }
        format.json { render :show, status: :ok, location: @camp_site }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @camp_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /camp_sites/1 or /camp_sites/1.json
  def destroy
    @camp_site.destroy

    respond_to do |format|
      format.html { redirect_to camp_sites_url, notice: "Camp site was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camp_site
      @camp_site = CampSite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def camp_site_params
      params.require(:camp_site).permit(:name, :address, :url, {images: []}, :detail)
    end
end
