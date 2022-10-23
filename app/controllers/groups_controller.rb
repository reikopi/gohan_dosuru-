class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new
    @group.save
    redirect_to shares_index_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
