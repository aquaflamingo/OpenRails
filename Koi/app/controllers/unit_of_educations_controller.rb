class UnitOfEducationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_topic
  before_action :find_uoe, only: [:edit,:update,:destroy,:complete]
  before_action :requires_same_user, only: [:complete, :edit, :update, :destroy]

  def new
    @uoe = @topic.unit_of_educations.build

  end

  def complete
      @uoe.update_attribute(:completed_at, Time.now)

      if @uoe.save
        redirect_to(@topic)
      else

      end
  end

  def create
    @uoe = @topic.unit_of_educations.build(uoe_params)

    if @uoe.save
      redirect_to topic_path(@topic)
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @uoe.update(uoe_params)
      redirect_to @topic, notice: 'Updated!'
    else
      render 'edit'
    end
  end

  def destroy
    @uoe.destroy
    redirect_to topic_path(@topic)
  end

  private
    def uoe_params
      params.require(:unit_of_education).permit(:title,:description,:points)
    end

    def find_uoe
      @uoe = UnitOfEducation.find(params[:id])
    end
    def find_topic
      @topic = Topic.find(params[:topic_id])
    end


    def requires_same_user
      unless current_user.id === @uoe.topic.user.id
        redirect_to root_path, alert: "You are not able to perform this action."
      end
    end
end
