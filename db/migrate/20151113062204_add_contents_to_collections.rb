class AddContentsToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :url, :string
  end
end
