class CreateEpisodes < ActiveRecord::Migration[7.0]
  def change
    create_table :episodes do |t|
      t.string :title
      t.text :plot
      t.integer :number
      t.belongs_to :season, foreign_key: true

      t.timestamps
    end
  end
end
