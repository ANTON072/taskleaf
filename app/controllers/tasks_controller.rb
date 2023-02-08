class TasksController < ApplicationController

  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = current_user.tasks.recent
  end

  def show
  end

  def new
    @task = Task.new
  end

  def confirm_new
    @task = current_user.tasks.build task_params
    # binding.irb
    unless @task.valid?
      render :new, status: :unprocessable_entity
    end
  end

  def create
    # 検証エラーがあってもう一度新規登録画面を表示する際に、ビューに検証を行った現物の
    # Taskオブジェクトを渡す必要があるので
    @task = current_user.tasks.build(task_params)
    if params[:back].present?
      render :new, status: :unprocessable_entity
      return
    end

    # ユーザーの入力次第では検証エラーによって登録が失敗するのでsave!ではなくsave
    if @task.save
      redirect_to @task, notice: "タスク「#{@task.name}」を登録しました。"
    else
      # binding.irb
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @task.update! task_params
    redirect_to tasks_url, notice: "タスク「#{@task.name}」を更新しました。"
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: "タスク「#{@task.name}」を削除しました。"
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end

  def set_task
    @task = current_user.tasks.find params[:id]
  end
end
