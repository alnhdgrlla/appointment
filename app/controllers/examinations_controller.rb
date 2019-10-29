class ExaminationsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]
  # before_action :must_be_admin, only: [:active_sessions]


  def index
    # if current_user.admin?
    #   @meetings = Meeting.all
    # else
    #   @meetings = current_user.meetings.where(user_id: current_user)
    # end
  end

  def show
    @comment = Comment.new
  end

  def new
    @meeting = Meeting.new
  end

  def edit
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.user_id = current_user.id

    if @meeting.save
      redirect_to @meeting
    end
  end

  def update
      if @meeting.update(meeting_params)
        redirect_to @meeting
      end
  end

  def destroy
    @meeting.destroy
  end

  # def active_sessions
  #   @active_sessions = Meeting.where("end_time > ?", Time.now)
  # end

  private
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    def meeting_params
      params.require(:meeting).permit(:name, :start_time, :end_time, :user_id)
    end

    # def must_be_admin
    #   unless current_user.admin?
    #     redirect_to meetings_path, alert: "You don't have access to this page"
    #   end
    # end
end
 