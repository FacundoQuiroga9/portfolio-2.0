class Admin::ProjectsController < ApplicationController
  before_action :authenticate

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to root_path, notice: 'Project was successfully destroyed.'
  end

  private

  def authenticate
    # Your authentication logic here
  end

  def project_params
    params.require(:project).permit(:title, :content, :technology_id, :image)
  end
end
