class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(name: group_params[:text])
  end

  def edit
    @group = Group.find()
  end

  private
  def group_params
    params.permit(:text)
  end
end
