class CreateLibraryItems < ActiveRecord::Migration[7.0]
  def change
    create_table :library_items do |t|
      t.references :user, foreign_key: true
      t.references :product, polymorphic: true
      t.datetime :expires_at

      t.timestamps
    end
  end
end
