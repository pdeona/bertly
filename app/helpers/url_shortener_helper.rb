module UrlShortenerHelper

  LETTERS = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten

  def short_url
    string = (0...8).map { LETTERS[rand(LETTERS.length)] }.join
  end

end
