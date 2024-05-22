class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]

  def index
    @projects = Project.all
  end

  def show
  end

  def react
    @projects = Project.joins(:technology).where(technologies: { name: 'React' })
    render partial: 'projects/react_projects', locals: { projects: @projects }
  end

  def rails
    @projects = Project.joins(:technology).where(technologies: { name: 'Ruby on Rails' })
    render partial: 'projects/rails_projects', locals: { projects: @projects }
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end
end
