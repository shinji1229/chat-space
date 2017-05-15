class MessagesController < ApplicationController

  before_action :create_instance, only: [:index, :create]

  def index
    @message = Message.new
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path, notice:'メッセージを作成しました'
    else
      flash.now[:alert] = 'メッセージを入力してください'
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id])
  end

  def create_instance
    @group = Group.find(params[:group_id])
    @groups = current_user.groups.order("created_at DESC")
    @messages = @group.messages
    @users = @group.users
  end

end
