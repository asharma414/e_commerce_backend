class Category < ApplicationRecord
    has_many :artifacts
    has_many :orders, through: :artifacts

    def self.sales_by_category
        category_totals = {}
        self.all.each {|category| category_totals[category.name] = category.orders.sum {|order| order.total_price}}
        category_totals
    end

end
