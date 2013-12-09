class MicropostsController < ApplicationController
  before_filter :signed_in_user,  except: :create_mobile
  before_filter :correct_user,   only: :destroy

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    render params[:micropost].inspect

    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def create_mobile
    token = params[:token]
    current_user ||= User.find_by_remember_token(token)
    @micropost = current_user.microposts.build({:content => params[:micropost]})
    if @micropost.save
      render :json => @micropost
    else
      render :json => @micropost
    end
  end



  def destroy
    @micropost.destroy
    redirect_to root_url
  end

  private

    def correct_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_url if @micropost.nil?
    end
end