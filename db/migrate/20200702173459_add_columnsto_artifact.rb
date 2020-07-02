class AddColumnstoArtifact < ActiveRecord::Migration[6.0]
  def change
    add_column :artifacts, :dimensions, :string
    add_column :artifacts, :medium, :string
    add_column :artifacts, :century, :string
    add_column :artifacts, :accession_year, :integer
    add_column :artifacts, :accession_method, :string
    add_column :artifacts, :culture, :string
    add_column :artifacts, :artist_name, :string
    add_column :artifacts, :artist_birthplace, :string
    add_column :artifacts, :artist_role, :string
    add_column :artifacts, :artist_lifetime, :string 
    

  end
end
