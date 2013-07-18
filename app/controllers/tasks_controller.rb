class TasksController < ApplicationController
  before_filter :find_instruction
  before_filter :find_task, :only => [:show, :edit, :update, :destroy]
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end


  def show
    @task = @instruction.tasks.build(params[:task])
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = @instruction.tasks.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = @instruction.tasks.build(params[:task])
    if @task.save
      flash[:notice] = "Task has been created."
      redirect_to [@instruction, @task]
    else
      flash[:alert] = "Task has not been created."
      render :action => "new"
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    if @task.update_attributes(params[:task])
      flash[:notice] = "Task has been updated."
      redirect_to [@instruction, @task]
    else
      flash[:alert] = "Task has not been updated."
      render :action => "edit"
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    flash[:notice] = "Task has been deleted."
    redirect_to @instruction
  end

  private
    def find_instruction
      @instruction = Instruction.find(params[:instruction_id])
    end
    def find_task
      @task = @instruction.tasks.find(params[:id])
    end
end
