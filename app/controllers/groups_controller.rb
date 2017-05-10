class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    if @group.save
      redirect_to :root
    else
      flash.now[:alert] = 'グループ名を入力してください'
      render :new
    end
  end

  def edit
    @group = Group.find()
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
