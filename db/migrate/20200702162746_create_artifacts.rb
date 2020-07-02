class CreateArtifacts < ActiveRecord::Migration[6.0]
  def change
    create_table :artifacts do |t|
      t.string :title
      t.integer :category_id
      t.string :technique
      t.string :dated
      t.string :image_url
      t.string :provenance
      t.text :formatted_text
      t.text :description
      t.boolean :sold

      t.timestamps
    end
  end
end
