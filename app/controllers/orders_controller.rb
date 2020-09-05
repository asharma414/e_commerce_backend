class OrdersController < ApplicationController

    def create
        order = Order.create_or_find_by(orderParams)
        list_price = Artifact.find(orderParams[:artifact_id])[:list_price]
        order.update(total_price: list_price, status: true)
        render json: order.to_json(:include => :artifact) 
    end

    def cart 
        render json: Order.where(user_id: params[:user_id], status: true).to_json(:include => :artifact) 
    end

    def checkout
        total = 0
        params[:orders].each do |order|
            ord = Order.find(order['id'])
            art = Artifact.find(order['artifact_id'])
            ord.status = false
            art.orders.each do |o|
                if o['id'] != order['id']
                    Order.destroy(o['id'])
                end 
            end
            art.sold = true
            art.save
            ord.save
            total += ord['total_price']
        end
        render json: {total: total, orders: params[:orders]}
    end

    def destroy
        render json: Order.destroy(params[:id])
    end

    private
        def orderParams
            params.require(:order).permit(:artifact_id, :user_id)
        end

end
