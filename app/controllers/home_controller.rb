class HomeController < ApplicationController
  def index
    @react_projects = Project.joins(:technology).where(technologies: { name: 'React' })
    @rails_projects = Project.joins(:technology).where(technologies: { name: 'Ruby on Rails' })
  end

  def profile_info
    render partial: 'home/profile_info'
  end
end
