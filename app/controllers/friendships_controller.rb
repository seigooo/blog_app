class FriendshipsController < ApplicationController
  before_action :set_user, only: [:follow_list, :follower_list]
  before_action :authenticate_user!

  def follow
    @follow = Friendship.new(from_user_id: current_user.id, to_user_id: params[:id])
    @follow.save
    flash[:notice] = "フォローしました。"
    redirect_to(:back)
  end

  def unfollow
    @follow = Friendship.find_by(:to_user_id => params[:id])
    @follow.destroy
    flash[:alert] = "フォローを外しました。"
    redirect_to(:back)
  end

  def follow_list
  end

  def follower_list
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end