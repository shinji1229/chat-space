class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
  end

  def edit
    @group = Group.find()
  end

  private
  def group_params
    params.require(:review).permit(:text)
  end
end
