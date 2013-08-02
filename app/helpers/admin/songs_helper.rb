module Admin::SongsHelper

  def featured_song_badge(song)
    if song.featured?
      content_tag(:div, class: "featured label label-info") do
        content_tag(:i, "", class: "icon-white icon-star") +
          " Featured (#{song.featured_order})"
      end
    end
  end

end
