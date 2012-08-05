class UsersController < ApplicationController

  def show
    @user = current_user
    @docs = @user.docs.alive
  end
end
