class V2::MeetingsController < ApplicationController
  def index
    @meetings = Meeting.all
  end

  def new
    @meeting = Meeting.new(category: "real")
  end

  def refresh
    @meeting = Meeting.new(meeting_params)
    render :new, status: :see_other
  end

  def create
    @meeting = Meeting.new(meeting_params)
    unless @meeting.save
      render :new, status: :unprocessable_entity
      return
    end
    redirect_to v2_meetings_path, status: :see_other
  end

  def root
  end

  private

  def meeting_params
    params.require(:meeting).permit(:title, :category, :meeting_room, :meeting_url)
  end
end
