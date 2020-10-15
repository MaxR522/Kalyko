class UsersController < ApplicationController
  class UsersController
    # GET /users/:id
    def show
      @user = User.find_by_uid!(params[:id])
    end
  
    # GET /users
    def index
      @user = User.all
    end
  end
end
