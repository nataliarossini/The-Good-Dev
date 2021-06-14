class MySkillsController < ApplicationController
  def create
    @my_skill = MySkill.new
    @user = User.find(params[:user_id])
    @skill = Skill.find(params[:skill])
    @my_skill.user = @user
    @my_skill.skill = @skill
    @my_skill.save
  end
end

