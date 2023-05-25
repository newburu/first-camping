class CampLogsController < ApplicationController
  before_action :set_camp_log, only: %i[ show edit update destroy ]

  # GET /camp_logs or /camp_logs.json
  def index
    @camp_logs = CampLog.all
  end

  # GET /camp_logs/1 or /camp_logs/1.json
  def show
  end

  # GET /camp_logs/new
  def new
    @camp_log = CampLog.new(camp_site_id: params[:camp_site])
  end

  # GET /camp_logs/1/edit
  def edit
  end

  # POST /camp_logs or /camp_logs.json
  def create
    @camp_log = CampLog.new(camp_log_params)
    @camp_log.user = current_user

    respond_to do |format|
      if @camp_log.save
        format.html { redirect_to camp_log_url(@camp_log), notice: "Camp log was successfully created." }
        format.json { render :show, status: :created, location: @camp_log }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @camp_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /camp_logs/1 or /camp_logs/1.json
  def update
    respond_to do |format|
      if @camp_log.update(camp_log_params)
        format.html { redirect_to camp_log_url(@camp_log), notice: "Camp log was successfully updated." }
        format.json { render :show, status: :ok, location: @camp_log }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @camp_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /camp_logs/1 or /camp_logs/1.json
  def destroy
    @camp_log.destroy

    respond_to do |format|
      format.html { redirect_to camp_logs_url, notice: "Camp log was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camp_log
      @camp_log = CampLog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def camp_log_params
      params.require(:camp_log).permit(:camp_site_id, :user_id, :start_day, :end_day, {images: []}, :detail)
    end
end
