class ToppagesController < ApplicationController
 before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  
  def index
   @tasks = Task.all.page(params[:page]).per(25)
  end
  
  private
  
 def set_task
   @task = Task.find(params[:id])
 end
end
