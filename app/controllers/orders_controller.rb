class OrdersController < ApplicationController

    def index
    end

    def create
        Order.create_or_find_by(orderParams)
        list_price = Artifact.find(orderParams[:artifact_id])[:list_price]
        order = Order.update(total_price: list_price, status: true)
        render json: order
    end

    def update
    end

    private
        def orderParams
            params.require(:order).permit(:artifact_id, :user_id)
        end

end
