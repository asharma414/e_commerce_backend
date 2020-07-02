class Category < ApplicationRecord
    has_many :artifacts
    has_many :orders, through: :artifacts

end
