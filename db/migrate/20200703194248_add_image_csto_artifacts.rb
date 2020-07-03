class AddImageCstoArtifacts < ActiveRecord::Migration[6.0]
  def change
    add_column :artifacts, :images, :text
  end
end
