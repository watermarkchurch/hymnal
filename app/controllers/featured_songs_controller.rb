class FeaturedSongsController < ApplicationController

  def index
    @songs = Song.featured
  end

end
