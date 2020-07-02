class OrderSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :artifact_id, :total_pricee, :status
end
