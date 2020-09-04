class User < ApplicationRecord
    has_many :orders
    has_many :artifacts, through: :orders
    has_many :categories, through: :artifacts


    def purchase_history
        self.artifacts.where(sold: true)
    end

end
