class Admin::SongSectionsController < AdminController
  before_action :set_song_section, only: [:edit, :update, :destroy]

  def new
    @song_section = SongSection.new(song_section_params)
  end

  def create
    @song_section = SongSection.new(song_section_params)

    respond_to do |format|
      if @song_section.save
        format.html { redirect_to [:admin, @song_section.song], notice: 'Song section was successfully created.' }
        format.json { render action: 'show', status: :created, location: @song_section }
      else
        format.html { render action: 'new' }
        format.json { render json: @song_section.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @song_section.update(song_section_params)
        format.html { redirect_to [:admin, @song_section.song], notice: 'Song section was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @song_section.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @song_section.destroy
    respond_to do |format|
      format.html { redirect_to admin_song_path(@song_section.song) }
      format.json { head :no_content }
    end
  end

  private

  def set_song_section
    @song_section = SongSection.find(params[:id])
  end

  def song_section_params
    params.require(:song_section).permit(:song_id, :ordered_by, :published, :title, :lyrics)
  end
end
