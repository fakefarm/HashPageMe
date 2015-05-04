class AddSlugToFetchers < ActiveRecord::Migration
  def change
    add_column :fetchers, :slug, :string
    add_index :fetchers, :slug
  end
end
