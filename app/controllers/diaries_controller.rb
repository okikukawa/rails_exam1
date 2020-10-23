class DiariesController < ApplicationController
  before_action :set_diary, only:[:show, :edit, :update, :destroy]
  def index
    @diarys = Diary.all
  end
  def new
    @diary = Diary.new
  end
  def create
    @diary = Diary.new(diary_params)
    if params[:back]
      render :new
    else
      if @diary.save
        redirect_to diaries_path,notice: "つぶやきました！"
      else
        render :new
      end
    end
  end
  def show
  end
  def edit
  end
  def update
    if @diary.update(diary_params)
      redirect_to diaries_path, notice:"編集しました！"
    else
      render :edit
    end
  end
  def destroy
    @diary.destroy
    redirect_to diaries_path,notice:"つぶやきを削除しました。"
  end
  def confirm
    @diary = Diary.new(diary_params)
    render :new if @diary.invalid?
  end
  private
  def diary_params
    params.require(:diary).permit(:content)
  end
  def set_diary
    @diary = Diary.find(params[:id])
  end
end
