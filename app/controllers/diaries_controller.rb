class DiariesController < ApplicationController
  def index
    @diarys = Diary.all
  end
  def new
    @diary = Diary.new
  end
  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      redirect_to new_diary_path,notice: "つぶやきました！"
    else
      render :new
    end
  end
  def show
    @diary = Diary.find(params[:id])
  end
  private
  def diary_params
    params.require(:diary).permit(:content)
  end
end
