class RemoveImageUrlFromArtifacts < ActiveRecord::Migration[6.0]
  def change
    remove_column :artifacts, :image_url
  end
end
