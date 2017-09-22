class AddShortenedUriToUrl < ActiveRecord::Migration[5.1]
  def change
    add_column :urls, :shortened_uri, :string
  end
end
