class ArtifactSerializer < ActiveModel::Serializer
  attributes :id, :category_id, :technique, :dated, :iimage_url, :provenance, :formatted_text, :description, :sold
end
