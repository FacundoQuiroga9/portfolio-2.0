class Admin::ProjectsController < ApplicationController
  before_action :authenticate_admin, only: [:new, :create, :edit, :update, :destroy]

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to root_path, notice: 'Project was successfully created.'
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
      redirect_to root_path, notice: 'Project was successfully updated.'
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

  def authenticate_admin
    unless session[:admin]
      redirect_to login_path, alert: "Please log in to continue"
    end
  end

  def project_params
    params.require(:project).permit(:title, :content, :technology_id, :image, :github_url, :website_url)
  end
end
