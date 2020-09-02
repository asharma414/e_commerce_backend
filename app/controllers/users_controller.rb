class UsersController < ApplicationController

    def create
        user = User.create_or_find_by(registerParams)
        user.update(admin: false)
        render json: user.to_json(:except => :password)
    end

    def login
        user = User.find_by(loginParams)
        if user
            render json: user.to_json(:except => :password)
        else
            render json: {error: true, message: "Incorrect username or password!"}
        end
    end

    def show
    end

    def update
    end

    def destroy
    end

    private

    def loginParams
        params.require(:user).permit(:username, :password)
    end

    def registerParams
        params.require(:user).permit(:first_name, :last_name, :username, :password)
    end

end
