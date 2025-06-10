class MotivationsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    if user_signed_in?
      @motivations = current_user.motivations
    else
      @motivations = Motivation.none
    end
    @blogs = Blog.all
  end

  def new
    @motivation = Motivation.new
  end

def create
  @motivation = current_user.motivations.build(motivation_params)

  if @motivation.save
    # 開発・本番問わずAPI呼び出すように修正
    advice = ChatgptAdvisor.get_advice(@motivation.contents.to_s)
    flash[:notice] = "目標を設定しました！ AIアドバイス：#{advice}"
    redirect_to motivations_path
  else
    render :new
  end
end

  def show
    @motivation = Motivation.find(params[:id])
    @comments = @motivation.comments
    @comment = Comment.new
  end

  def edit
    @motivation = Motivation.find(params[:id])
  end

  def update
    @motivation = Motivation.find(params[:id])
    if @motivation.update(motivation_params)
      redirect_to motivation_path(@motivation), notice: "目標を更新しました！"
    else
      render :edit
    end
  end

  def destroy
    @motivation = Motivation.find(params[:id])
    @motivation.destroy
    redirect_to motivations_path, notice: "目標を削除しました"
  end

  private

  def motivation_params
    params.require(:motivation).permit(:contents, :title)
  end
end
