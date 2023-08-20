class CreatePurchaseOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_options do |t|
      t.decimal :price, precision: 5, scale: 2, default: 2.99
      t.integer :video_quality

      t.timestamps
    end
  end
end
