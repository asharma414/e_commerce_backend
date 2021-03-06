class ArtifactSerializer < ActiveModel::Serializer
  attributes :id, :updated_at, :category_id, :technique, :dated, :provenance, :description, :sold, :list_price, :dimensions, :century, :medium, :accession_method, :accession_year, :culture, :artist_name, :artist_role, :artist_birthplace, :artist_lifetime, :title, :verification, :images, :primary_image, :verification_number
end
