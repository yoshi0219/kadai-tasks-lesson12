class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.all.page(params[:page]).per(25)
  end
  
  def show
    set_task
    
  end
  
  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = '正常に投稿されました。'
      redirect_to @task
    else
      flash.now[:danger] = '正常に更新されませんでした。'
      render :new
    end
  end
  
  def new
    @task = Task.new
  end
  
  def edit
    set_task
  end
  
  
  def destroy
    @task.destroy
    flash[:success] = 'タスクを消去しました。'
    redirect_to root_path
  end
  
  
  def update
    set_task
    
    if @task.update(task_params)
      flash[:success] = '正常に更新されました。'
      redirect_to @task
    else
      flash.now[:danger] = '正常に更新できませんでした。'
      render :edit
    end
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:title,:content,)
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
    redirect_to root_url
    end
  end
end
