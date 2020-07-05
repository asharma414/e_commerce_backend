class AddPrimaryImageToArtifacts < ActiveRecord::Migration[6.0]
  def change
    add_column :artifacts, :primary_image, :string
  end
end
