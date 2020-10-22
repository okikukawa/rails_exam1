class DiariesController < ApplicationController
  def index
    @diarys = Diary.all
  end
  def new
    @diary = Diary.new
  end
  def create
    Diary.create(diary_params)
    redirect_to new_diary_path
  end
  private
  def diary_params
    params.require(:diary).permit(:content)
  end
end
