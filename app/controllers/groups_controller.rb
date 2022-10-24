class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.admin_member_id = current_member.id
    # binding.pry
    @group.save
    redirect_to shares_path
  end

  def show
    @group = Group.find(params[:id])
    @group_members = GroupMember.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def group_params
    params.require(:group).permit(:group_name, :group_code, :password)
  end
end
