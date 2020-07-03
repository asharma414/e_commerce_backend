class AddVerificationtoArtifacts < ActiveRecord::Migration[6.0]
  def change
    add_column :artifacts, :verification, :string
  end
end
