class UrlShortenerController < ApplicationController
  include UrlShortenerHelper

  def new
    @url = Url.new
  end

  def create
    if params.include? :url_shortener
      @url = Url.new(url_shortener_params)
    else
      uri_string = params[:protocol] + '//' + params[:uri_domain] + '.' + params[:uri_substring]
      @url = Url.new(uri_string: uri_string)
      p @url
    end
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
