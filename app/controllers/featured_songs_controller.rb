class FeaturedSongsController < ApplicationController

  def index
    @songs = Song.all
  end

end
