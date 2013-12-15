class RelationshipsController < ApplicationController
  before_filter :signed_in_user ,except: :create_mobile

  respond_to :html, :js

  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    respond_with @user
  end

  def create_mobile
    user = User.find_by_remember_token(params[:token])
    id = params[:id]
    @user = User.find(id)
    user.follow!(@user)
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    respond_with @user
  end
end