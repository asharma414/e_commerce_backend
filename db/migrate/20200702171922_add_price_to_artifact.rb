class AddPriceToArtifact < ActiveRecord::Migration[6.0]
  def change
    add_column :artifacts, :list_price, :decimal
  end
end
