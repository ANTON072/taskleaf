class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find params[:id]
  end

  def new
    @task = Task.new
  end

  def create
    # 検証エラーがあってもう一度新規登録画面を表示する際に、ビューに検証を行った現物の
    # Taskオブジェクトを渡す必要があるので
    @task = Task.new(task_params)
    # ユーザーの入力次第では検証エラーによって登録が失敗するのでsave!ではなくsave
    if @task.save
      redirect_to @task, notice: "タスク「#{@task.name}」を登録しました。"
    else
      # binding.irb
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find params[:id]
  end

  def update
    task = Task.find params[:id]
    task.update task_params
    redirect_to tasks_url, notice: "タスク「#{task.name}」を更新しました。"
  end

  def destroy
    task = Task.find params[:id]
    task.destroy
    redirect_to tasks_url, notice: "タスク「#{task.name}」を削除しました。"
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
