class AddUrlsToProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :github_url, :string
    add_column :projects, :website_url, :string
  end
end
