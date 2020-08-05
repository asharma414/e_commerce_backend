class StatsController < ApplicationController

    def index
        render json: {:total_sales => Order.total_sales, :sales_by_verification => Order.sales_by_verification, :sales_by_category => Category.sales_by_category}.as_json
    end

end
