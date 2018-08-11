class TopicsController < ApplicationController
  helper TopicHelper

  before_action :authenticate_user!
  before_action :find_topic, only: [:show, :destroy, :update, :edit]
  before_action :requires_same_user, only: [:edit,:show, :update, :destroy]

  def create
    @topic = current_user.topics.build(topic_params)

    if @topic.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  def new
    @topic = current_user.topics.build
  end

  def index
    @topics = current_user.topics
  end

  def destroy
    @topic.destroy
    redirect_to root_path
  end

  def update
    if @topic.update(topic_params)
      redirect_to @topic, notice: "Updated!"
    else
      render 'edit'
    end
  end

  def edit

  end

  def show
    @topic = Topic.find(params[:id])
  end

  private
  def topic_params
    params.require(:topic).permit(:title,:description,:max_units)
  end

  def find_topic
    @topic = Topic.find(params[:id])
  end

  def requires_same_user
    unless current_user.id === @topic.user.id
      redirect_to root_path, alert: "You are not able to perform this action."
    end
  end
end
