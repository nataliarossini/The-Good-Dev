class UsersController < ApplicationController
  def dashboard
    @my_skill = MySkill.new
    @user = current_user
  end
end
