class OrdersController < ApplicationController

    def index
    end

    def create
        order = Order.create_or_find_by(orderParams)
        list_price = Artifact.find(orderParams[:artifact_id])[:list_price]
        order.update(total_price: list_price, status: true)
        render json: order
    end

    def cart 
        render json: Order.where(user_id: params[:user_id], status: true) 
    end

    def update
    end

    private
        def orderParams
            params.require(:order).permit(:artifact_id, :user_id)
        end

end
