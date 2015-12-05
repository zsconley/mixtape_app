class UploadsController < ApplicationController
  
  before_action :set_upload, only: [:show, :edit, :update, :destroy, :audio_download]

  # GET /uploads
  # GET /uploads.json
  def index
    @uploads = current_user.uploads.all
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
  end

  # GET /uploads/new
  def new
    @upload = Upload.new
  end

  # GET /uploads/1/edit
  def edit
  end

  # POST /uploads
  # POST /uploads.json
  def create
    @upload = current_user.uploads.new(upload_params)

    respond_to do |format|
      if @upload.save
        format.html { redirect_to @upload, notice: 'Upload was successfully created.' }
        format.json { render :show, status: :created, location: @upload }
      else
        format.html { render :new }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uploads/1
  # PATCH/PUT /uploads/1.json
  def update
    respond_to do |format|
      if @upload.update(upload_params)
        format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
        format.json { render :show, status: :ok, location: @upload }
      else
        format.html { render :edit }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @upload.destroy
    respond_to do |format|
      format.html { redirect_to uploads_url, notice: 'Upload was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def audio_download
  #  @upload = Upload.find(params[:id])
  #   file_path = @upload.audio_file_name
  #   if !file_path.nil?
  #   send_file "#{Rails.root}/public/system/audios/#{@upload.id}/original/#{file_path}", :x_sendfile => true 
  #   else 
  #          redirect_to uploads_url
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = current_user.uploads.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upload_params
      params.require(:upload).permit(:song, :album, :artist, :cover, :audio)
    end
end
