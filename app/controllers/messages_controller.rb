class MessagesController < ApplicationController

  before_action :create_instance, only: [:index, :create]

  def index
    @message = Message.new
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      respond_to do |format|
       format.html { redirect_to group_messages_path, notice:'メッセージを作成しました' }
       format.json { render 'create.json.jbuilder' }
      end

    else
      redirect_to group_messages_path, alert: 'メッセージを入力してください'
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
