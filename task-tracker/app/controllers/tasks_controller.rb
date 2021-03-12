# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :authenticate!
  before_action :set_task, only: %i[edit update destroy]

  def index
    @tasks = Task.order(created_at: :desc)
    @new_task = Task.new
  end

  def current
    @tasks = Task.for_popug current_popug["id"]
  end

  def edit; end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_url
    else
      redirect_to tasks_url, alert: task_errors
    end
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_url
    else
      flash.now.alert = task_errors
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_errors
    @task.errors.map(&:full_message).join
  end

  def task_params
    params.require(:task).permit(:description, :status)
  end
end
