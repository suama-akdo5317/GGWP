class UsersController < ApplicationController

    def show
      @name = current_user.username
    end
  
end
