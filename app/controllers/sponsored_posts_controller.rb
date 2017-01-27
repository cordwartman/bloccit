class SponsoredPostsController < ApplicationController
  def show
    @sponsoredpost = SponsoredPost.find(params[:id])
  end

  def new
  end

  def edit
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @sponsoredpost = SponsoredPost.new
  end

  def create
    @sponsoredpost = SponsoredPost.new(sponsored_post_params)
    @topic = Topic.find(params[:topic_id])
    @sponsoredpost.topic = @topic
    
    if @sponsoredpost.save
      flash[:notice] = "Sponsored Post was saved."
      redirect_to [@topic, @sponsoredpost]
    else
      flash.now[:alert] = "There was an error saving the sponsored post. Please try again."
      render :new
    end
  end

  def edit
    @sponsoredpost = SponsoredPost.find(params[:id])
  end

  def update
    @sponsoredpost = SponsoredPost.find(params[:id])
    
    if @sponsoredpost.update_attributes(sponsored_post_params)
      flash[:notice] = "Sponsored Post was updated."
      redirect_to [@sponsoredpost.topic, @sponsoredpost]
    else
      flash.now[:alert] = "There was an error saving the sponsored post. Please try again."
      render :edit
    end
  end
 
  def destroy
    @sponsoredpost = SponsoredPost.find(params[:id])
    
    if @sponsoredpost.destroy
      flash[:notice] = "\"#{@sponsoredpost.title}\" was deleted successfully."
      redirect_to @sponsoredpost.topic
    else
      flash.now[:alert] = "There was an error deleting the sponsored post."
      render :show
    end
  end
  
  private
  
  def sponsored_post_params
    params.require(:sponsored_post).permit(:title, :body, :price)
  end
end
