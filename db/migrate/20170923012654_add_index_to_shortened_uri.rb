class AddIndexToShortenedUri < ActiveRecord::Migration[5.1]
  def change
    add_index :urls, :shortened_uri, unique: true
  end
end
