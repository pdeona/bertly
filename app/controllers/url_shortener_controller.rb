class UrlShortenerController < ApplicationController
  include UrlShortenerHelper

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_shortener_params)
    @url.shortened_uri = short_url
    if @url.save
      render 'show_link', url: @url
    else
      flash[:danger] = 'That was an invalid URI.'
      render 'new'
    end
  end

  def show
    @url = Url.find_by shortened_uri: params[:shortened_uri]
    redirect_to @url.uri_string
  end

  private

  def url_shortener_params
    params.require(:url_shortener).permit(:uri_string)
  end

end
