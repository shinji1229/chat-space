class GroupsController < ApplicationController

before_action :find_group, only: [:edit, :update]

  def index
    @groups = current_user.groups.order("created_at DESC")
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_messages_path(@group), notice:'グループを作成しました'
    else
      flash.now[:alert] = 'グループ名を入力してください'
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice:'グループを編集しました'
    else
      flash.now[:alert] = 'グループ名を表示してください'
      render :edit
    end
  end

  def search
    @users = User.where('name LIKE(?)', "%#{ params[:keyword] }%").where.not(id: current_user.id)
    respond_to do |format|
      format.json
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def find_group
    @group = Group.find(params[:id])
  end
end
