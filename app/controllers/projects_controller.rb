class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to projects }
        format.js
      else
        format.html
        flash.now[:error] = 'Project could not be saved.'
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @project.update_attributes(project_params)
      redirect_to @project, notice: 'Changes successfully saved'
    else
      flash.now[:error] = 'Changes not saved'
      render :edit
    end
  end

  def show
  end

  def destroy
    @project.destroy
    format.js
    redirect_to projects_path, notice: 'Project has been deleted'
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
