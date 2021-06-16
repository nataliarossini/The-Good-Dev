class ChatroomsController < ApplicationController
  # def index
  #   @chatrooms = current_user.all_chatrooms
  # end

  def show
    @chatroom = Chatroom.find(params[:id])
    @chatroom.messages.where.not(user: current_user).update_all(read: true)
    @message = Message.new
    @messages = @chatroom.messages.order(created_at: :asc)
  end

  def create
    @chatroom = Chatroom.new(name: "Contact")
    @project = Project.find(params[:project_id])
    @chatroom.user = current_user
    @chatroom.recipient = @project.organization.user
    @chatroom.save
    redirect_to chatroom_path(@chatroom)
  end
end
