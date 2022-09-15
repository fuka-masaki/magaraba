class ImagesController < ApplicationController
    def ogp
      manga_name = params[:manga]
      post_title = params[:title]
      ogp_manga_name = manga_name.gsub('_',' ')
      ogp_title = post_title.gsub('_',' ')
      text = "【#{ogp_manga_name}】" << ogp_title
      image = OgpCreator.build(text).tempfile.open.read
      send_data image, :type => 'image/png',:disposition => 'inline'
    end
end
