class MyLanguagesController < ApplicationController
  def create
    @my_language = MyLanguage.new
    @user = User.find(params[:user_id])
    @language = Language.find(params[:language])
    @my_language.user = current_user
    @my_language.language = @language
    @my_language.save
  end
end
