class Order < ApplicationRecord
    belongs_to :user
    belongs_to :artifact

    def self.total_sales
        self.all.sum {|order| order.total_price}
    end


    def self.sales_by_verification
        verification_sales = Hash.new(0)
        self.all.where(status: false).each {|order| verification_sales[/^([^.]+)/.match(order.artifact[:verification]).to_s] += order.total_price}
        verification_sales
    end

end
