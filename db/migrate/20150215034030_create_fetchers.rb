class CreateFetchers < ActiveRecord::Migration
  def change
    create_table :fetchers do |t|
      t.string :username

      t.timestamps
    end
  end
end
