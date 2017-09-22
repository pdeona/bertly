class Url < ApplicationRecord

  validates :uri_string, presence: true, format: { with: URI::regexp }
  validates :shortened_uri, uniqueness: true

end
