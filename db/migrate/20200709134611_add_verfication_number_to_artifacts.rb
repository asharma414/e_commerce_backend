class AddVerficationNumberToArtifacts < ActiveRecord::Migration[6.0]
  def change
    add_column :artifacts, :verification_number, :integer
  end
end
