class RemoveFormattedTextfromArtifact < ActiveRecord::Migration[6.0]
  def change
    remove_column :artifacts, :formatted_text
  end
end
