class TodoProjectsController < ApplicationController
  before_action :set_todo_project, only: [:show, :edit, :update, :destroy]

  # GET /todo_projects
  # GET /todo_projects.json
  def index
    @todo_projects = TodoProject.all
  end

  # GET /todo_projects/1
  # GET /todo_projects/1.json
  def show
  end

  # GET /todo_projects/new
  def new
    @todo_project = TodoProject.new
  end

  # GET /todo_projects/1/edit
  def edit
  end

  # POST /todo_projects
  # POST /todo_projects.json
  def create
    @todo_project = TodoProject.new(todo_project_params)

    respond_to do |format|
      if @todo_project.save
        format.html { redirect_to @todo_project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @todo_project }
      else
        format.html { render :new }
        format.json { render json: @todo_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todo_projects/1
  # PATCH/PUT /todo_projects/1.json
  def update
    respond_to do |format|
      if @todo_project.update(todo_project_params)
        format.html { redirect_to @todo_project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo_project }
      else
        format.html { render :edit }
        format.json { render json: @todo_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_projects/1
  # DELETE /todo_projects/1.json
  def destroy
    Rails.logger.info "We are deleting project"
    @todo_project.destroy
    respond_to do |format|
      format.html { redirect_to todo_projects_url, notice: 'Project was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_project
      @todo_project = TodoProject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_project_params
      params.require(:todo_project).permit(:title, :description)
    end
end
