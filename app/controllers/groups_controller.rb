class GroupsController < ApplicationController

  def new
    @groups = Group.new
  end

  def create
    @groups = Group.create(name: group_params[:text])
  end

  def edit
    @groups = Group.find()
  end

  private
  def group_params
    params.permit(:text)
  end
end
