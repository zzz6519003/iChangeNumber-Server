class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def home_mobile
    token = params[:token]
    current_user ||= User.find_by_remember_token(token)
    @micropost  = current_user.microposts.build
    @feed_items = current_user.feed.paginate(page: params[:page])
    render :json => @feed_items
  end

  def find_mobile
    token = params[:token]
    current_user ||= User.find_by_remember_token(token)
    renren = params[:renren_id]
    current_user.update_attribute(:renren_id,renren)

  end

  def help
  end

  def about
  end

  def contact
  end
end
