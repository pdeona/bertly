class UrlShortenerController < ApplicationController
  include UrlShortenerHelper

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_shortener_params)
    @url.shortened_uri = short_url
    if @url.save
      render 'show'
    else
      flash[:danger] = 'That was an invalid URI.'
      render 'new'
    end
  end

  def show
    @url = Url.find params[:id]
    redirect_to @url.uri_string
  end

  private

  def url_shortener_params
    params.require(:url_shortener).permit(:uri_string)
  end

end
